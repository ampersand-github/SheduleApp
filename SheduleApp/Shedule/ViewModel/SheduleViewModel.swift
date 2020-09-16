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

  init() {
    token = modelResults?.observe { [weak self] _ in
      self?.todoList = self?.modelResults?.map {
        SheduleModel(id: $0.id, title: $0.title, dateDeadLine: $0.dateDeadLine, timeDeadLine: $0.timeDeadLine, isComplete: $0.isComplete)
      } ?? []
    }
  }

  deinit {
    token?.invalidate()
  }

  func validate_isThereTitle(title: String) -> Bool {
    if title.count == 0 {
      return false
    }
    return true
  }

  // TODO: textfieldの挙動上、エンターなり、押して確定しないと反映されないので、実際には30字以上の登録も可能。このバグはtextfieldの挙動が変更されるまで待つ
  func validate_isTitleLengthWithin30(title: String) -> Bool {
    if title.count > 30 {
      return false
    }
    return true
  }

  func toggle(id: String, isComplete: Bool) {
    let realm = try? Realm()
    let record = realm?.objects(SheduleRealmModel.self).filter("id = %@", id).first
    try? realm?.write {
      record?.isComplete = !isComplete
    }
  }

  func convertFromModelToRealmModel(model: SheduleModel) -> SheduleRealmModel {
    let model = SheduleRealmModel()
    model.title = editingShedule.title
    model.dateDeadLine = editingShedule.dateDeadLine
    model.timeDeadLine = editingShedule.timeDeadLine
    model.isComplete = editingShedule.isComplete
    return model
  }

  func createRecord() {
    print("addRecord")
    let realm = try? Realm()
    try? realm?.write {
      realm?.add(
        convertFromModelToRealmModel(model: editingShedule)
      )
    }
  }

  func updateRecord(todo: SheduleModel) {
    print("updateRecord")
    let realm = try? Realm()
    let record = realm?.objects(SheduleRealmModel.self).filter("id = %@", todo.id).first
    try? realm?.write {
      record?.title = todo.title
      record?.dateDeadLine = todo.dateDeadLine
      record?.timeDeadLine = todo.timeDeadLine
      record?.isComplete = todo.isComplete
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

  func isUpdate(id: String) -> Bool {
    let realm = try? Realm()
    let record = realm?.objects(SheduleRealmModel.self).filter("id = %@", id).first
    if record == nil {
      return false
    } else {
      return true
    }
  }
}
