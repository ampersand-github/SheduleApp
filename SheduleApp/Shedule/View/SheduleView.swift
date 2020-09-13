//
//  ContentsView.swift
//  SwiftUIPrograming
//
//  Created by 開発 on 2020/08/28.
//  Copyright © 2020 開発. All rights reserved.
//

import SwiftUI
// TODO: ソート機能
struct SheduleView: View {
  @EnvironmentObject var todoVM: SheduleViewModel
  @State private var vibrateOnRing = false
  var body: some View {
    VStack(alignment: .leading) {
      List {
        ForEach(todoVM.todoList) { shedule in
          VStack {
            CardView(shedule: shedule)
            Spacer().frame(height: 8)
          }
        }
        .onDelete { indexSet in self.todoVM.deleteRecord(indexSet: indexSet) }
      }.onAppear { UITableView.appearance().separatorStyle = .none }
        .onDisappear { UITableView.appearance().separatorStyle = .singleLine }
        .padding(.horizontal, 24)
      Spacer()
    }
  }
}

struct SheduleView_Previews: PreviewProvider {
  static var previews: some View {
    /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
  }
}
