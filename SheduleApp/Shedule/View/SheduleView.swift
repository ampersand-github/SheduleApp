//
//  ContentsView.swift
//  SwiftUIPrograming
//
//  Created by 開発 on 2020/08/28.
//  Copyright © 2020 開発. All rights reserved.
//

import SwiftUI

struct SheduleView: View {
  @EnvironmentObject var todoVM: SheduleViewModel
  @State private var vibrateOnRing = false
  // TODO: ｖｍへ
  static let dateFormatter: DateFormatter = customDateFormatter(format: "yyyy/MM/dd")
  static let timeFormatter: DateFormatter = customDateFormatter(format: "hh:mm")

  var body: some View {
    // TODO: セーフエリアの設定
    VStack(alignment: .leading) {
      EditButton()
      List {
        ForEach(todoVM.todoList) { todo in
          VStack {
            CardView(todo: todo)
            Spacer().frame(height: 8)
          }
        }
        // .onDelete { _ in self.todoVM.deleteAll() }
        .onDelete { indexSet in self.todoVM.deleteRecord(indexSet: indexSet) }
        .onMove(perform: rowReplace)
      }.onAppear { UITableView.appearance().separatorStyle = .none }
        .onDisappear { UITableView.appearance().separatorStyle = .singleLine }

        .padding(.horizontal, 24)
      Spacer()
    }
  }
}

// TODO: つくる
func rowReplace(_ from: IndexSet, _ to: Int) {
  //    fruits.move(fromOffsets: from, toOffset: to)
}

struct SheduleView_Previews: PreviewProvider {
  static var previews: some View {
    /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
  }
}
