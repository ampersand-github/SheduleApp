//
//  ContentView.swift
//  SwiftUI+Realm
//
//  Created by Takuya Yokoyama on 2020/02/03.
//  Copyright © 2020 Takuya Yokoyama. All rights reserved.
//

// [https://llcc.hatenablog.com/entry/2020/04/26/205254 Realm Swift + SwiftUIでテーブル表示・編集・削除 - しめ鯖日記]

import SwiftUI

struct SampleView: View {
    @ObservedObject var sampleVM = SampleViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(sampleVM.samples, id: \.id) { sample in
                    HStack {
                        Text("\(sample.title)")
                        Button(action: { self.sampleVM.deleteRecord(id: sample.id) }, label: { Text("ゴミ") })
                        Button(action: { self.sampleVM.editRecord(id: sample.id, title: "\(Date())") }, label: { Text("編集") })
                        Button(action: { self.sampleVM.printAllData() }, label: { Text("出力") })
                    }
                }.buttonStyle(BorderlessButtonStyle())
            }.navigationBarItems(trailing:
                Button(
                    action: { self.sampleVM.addRecord(string: "\(Date())") },
                    label: { Text("ADD") }
                )
            )
        }
    }
}
  
struct Sample_Previews: PreviewProvider {
    static var previews: some View {
        SampleView()
    }
}
