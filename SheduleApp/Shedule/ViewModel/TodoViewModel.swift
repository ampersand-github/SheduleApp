//
//  TodoViewModel.swift
//  SwiftUIPrograming
//
//  Created by 開発 on 2020/08/14.
//  Copyright © 2020 開発. All rights reserved.
//

import SwiftUI

class TodoViewModel: ObservableObject {
  @Published var todoList: [TodoModel]
  init(isSetDammy: Bool = false) {
    todoList = []
    isSetDammy ? addDammyList() : nil
  }

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
        TodoModel(title: "アマゾンの注文が届く", dateDeadLine: dammy1, timeDeadLine: dammy1, isComplete: false),
        TodoModel(title: "OOUI本読む", dateDeadLine: dammy2, timeDeadLine: dammy2, isComplete: true),
        TodoModel(title: "試験の申込み", dateDeadLine: dammy3, timeDeadLine: dammy3, isComplete: false),
        TodoModel(title: "友達と遊ぶ", dateDeadLine: dammy4, timeDeadLine: dammy4, isComplete: false),
        TodoModel(title: "試験のための本を買う", dateDeadLine: dammy5, timeDeadLine: dammy5, isComplete: false),
        TodoModel(title: "クリーニングに出す", dateDeadLine: dammy6, timeDeadLine: dammy6, isComplete: false),
        TodoModel(title: "衣替えする", dateDeadLine: dammy7, timeDeadLine: dammy7, isComplete: false)
      ]
    )
  }

  func setTodo(id: UUID) {}

  // todo 編集
  // todo 削除
}

struct TodoViewModel_Previews: PreviewProvider {
  static var previews: some View {
    /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
  }
}
