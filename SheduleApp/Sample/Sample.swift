//
//  ContentView.swift
//  SwiftUI+Realm
//
//  Created by Takuya Yokoyama on 2020/02/03.
//  Copyright © 2020 Takuya Yokoyama. All rights reserved.
//


// [https://llcc.hatenablog.com/entry/2020/04/26/205254 Realm Swift + SwiftUIでテーブル表示・編集・削除 - しめ鯖日記]

import UIKit
import RealmSwift
import SwiftUI

class MyModel: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var title = "sssss"
}



struct ContentViewCellModel {
    let id: String
    let title: String
}

class ContentViewModel: ObservableObject {
        private var token: NotificationToken?
        private var myModelResults = try? Realm().objects(MyModel.self)
        @Published var cellModels: [ContentViewCellModel] = []
        
        init() {
            token = myModelResults?.observe { [weak self] _ in
                self?.cellModels = self?.myModelResults?.map { ContentViewCellModel(id: $0.id, title: $0.title) } ?? []
            }
        }
        
        deinit {
            token?.invalidate()
        }
    }

struct SampleView: View {
              @ObservedObject var model = ContentViewModel()
              
              var body: some View {
                  NavigationView {
                      List {
                          ForEach(model.cellModels, id: \.id) { cellModel in
                              Button(action: {
                                  let myModel = try? Realm().objects(MyModel.self).filter("id = %@", cellModel.id).first
                                  try? Realm().write {
                                      myModel?.title = "\(Date())"
                                  }
                              }) {
                                  Text("\(cellModel.title)")
                              }
                          }.onDelete { indexSet in
                              let realm = try? Realm()
                              if let index = indexSet.first, let myModel = realm?.objects(MyModel.self).filter("id = %@", self.model.cellModels[index].id).first {
                                  try? realm?.write {
                                      realm?.delete(myModel)
                                  }
                              }
                          }
                      }.navigationBarItems(trailing: Button(action: {
                          let myModel = MyModel()
                          myModel.title = "\(Date())"
                          let realm = try? Realm()
                          try? realm?.write {
                              realm?.add(myModel)
                          }
                      }) {
                          Text("Add")
                      })
                  }
              }
          }
  
  
  
  
struct Sample_Previews: PreviewProvider {
  static var previews: some View {
    SampleView()
  }
}
