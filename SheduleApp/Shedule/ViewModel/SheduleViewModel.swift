//
//  TodoViewModel.swift
//  SwiftUIPrograming
//
//  Created by 開発 on 2020/08/14.
//  Copyright © 2020 開発. All rights reserved.
//

import RealmSwift
import SwiftUI

class SheduleViewModel: ObservableObject {
  let dateFormatter: DateFormatter = customDateFormatter(format: "yyyy/MM/dd")
  let timeFormatter: DateFormatter = customDateFormatter(format: "hh:mm")
  // editingで使用する一時的な値を入れる変数
  @Published var editingShedule: SheduleModel = SheduleModel()
  // - - - - -
  // 表示するときは[model]で、書き込みなどのdb操作をする場合はrealm
  // - - - - -
  private var token: NotificationToken?
  private var modelResults = try? Realm().objects(SheduleRealmModel.self)
  @Published var todoList: [SheduleModel] = []

  init(isSetDammy: Bool = false) {
    token = modelResults?.observe { [weak self] _ in
      self?.todoList = self?.modelResults?.map {
        SheduleModel(id: $0.id, title: $0.title, dateDeadLine: $0.dateDeadLine, timeDeadLine: $0.timeDeadLine, isComplete: $0.isComplete)
      } ?? []
    }
  }

  deinit {
    token?.invalidate()
  }

  /*
   func addDammyList() {
     let dammy1 = Calendar.current.date(byAdding: .day, value: -2, to: Date())!
     let dammy2 = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
     let dammy3 = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
     let dammy4 = Calendar.current.date(byAdding: .day, value: 2, to: Date())!
     let dammy5 = Calendar.current.date(byAdding: .day, value: 3, to: Date())!
     let dammy6 = Calendar.current.date(byAdding: .day, value: 3, to: Date())!
     let dammy7 = Calendar.current.date(byAdding: .day, value: 4, to: Date())!
     todoList.append(
       contentsOf: [
         SheduleModel(title: "アマゾンの注文が届く", dateDeadLine: dammy1, timeDeadLine: dammy1, isComplete: false),
         SheduleModel(title: "OOUI本読む", dateDeadLine: dammy2, timeDeadLine: dammy2, isComplete: true),
         SheduleModel(title: "試験の申込み", dateDeadLine: dammy3, timeDeadLine: dammy3, isComplete: false),
         SheduleModel(title: "友達と遊ぶ", dateDeadLine: dammy4, timeDeadLine: dammy4, isComplete: false),
         SheduleModel(title: "試験のための本を買う", dateDeadLine: dammy5, timeDeadLine: dammy5, isComplete: false),
         SheduleModel(title: "クリーニングに出す", dateDeadLine: dammy6, timeDeadLine: dammy6, isComplete: false),
         SheduleModel(title: "衣替えする", dateDeadLine: dammy7, timeDeadLine: dammy7, isComplete: false)
       ]
     )
   }
   */
  func toggle(id: String, isComplete: Bool) {
    let realm = try? Realm()
    let record = realm?.objects(SheduleRealmModel.self).filter("id = %@", id).first
    try? realm?.write {
      record?.isComplete = !isComplete
    }
  }

  func convertFromModelToRealmModel(model: SheduleModel) -> SheduleRealmModel {
    let aaaa = SheduleRealmModel()
    print("- - - - - -")
    print(editingShedule.title
    )
    aaaa.title = editingShedule.title
    aaaa.title = editingShedule.title
    aaaa.dateDeadLine = editingShedule.dateDeadLine
    aaaa.timeDeadLine = editingShedule.timeDeadLine
    aaaa.isComplete = editingShedule.isComplete
    return aaaa
  }

  func addRecord() {
    let realm = try? Realm()
    try? realm?.write {
      realm?.add(
        convertFromModelToRealmModel(model: editingShedule)
      )
    }
  }

  func deleteRecord(indexSet: IndexSet) {
    print(indexSet)
    if indexSet.first != nil {
      let realm = try? Realm()
      try? realm?.write {
        if let index = indexSet.first, let record = realm?.objects(SheduleRealmModel.self).filter("id = %@", self.todoList[index].id).first {
          realm?.delete(record)
        }
      }
    }
  }

  func deleteAll() {
    let realm = try? Realm()
    for todo in todoList {
      let record = realm?.objects(SheduleRealmModel.self).filter("id = %@", todo.id).first
      try? realm?.write {
        realm?.delete(record!)
      }
    }
  }
}
