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
  static let dateFormatter: DateFormatter = customDateFormatter(format: "yyyy/MM/dd")
  static let timeFormatter: DateFormatter = customDateFormatter(format: "hh:mm")
  var body: some View {
    // TODO: セーフエリアの設定
    VStack(alignment: .leading) {
      ScrollView {
        ForEach(todoVM.todoList) { todo in
          CardView(todo: todo)
          Spacer().frame(height: 24)
        }
      }
      .padding(.horizontal, 24)
      Spacer()
    }
  }
}

struct SheduleView_Previews: PreviewProvider {
  static var previews: some View {
    SheduleView().environmentObject(SheduleViewModel(isSetDammy: true))
  }
}
