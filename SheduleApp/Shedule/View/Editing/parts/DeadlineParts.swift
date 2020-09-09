//
//  DeadlineComponent.swift
//  SwiftUIPrograming
//
//  Created by 開発 on 2020/08/21.
//  Copyright © 2020 開発. All rights reserved.
//

import SwiftUI

struct DeadlineParts: View {
  var type: String
  @EnvironmentObject var sheduleVM: SheduleViewModel
  // @State private var selectionDate = Date()
  // @State var tempDate: Date
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  lazy var title = type == "date" ? "日付" : "時間"
  func getTitle() -> String {
    var mySelf = self
    print(mySelf.title)
    return mySelf.title
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  var body: some View {
    VStack(alignment: .leading) {
      Text(getTitle() + "の期限").font(.headline)
      VStack {
        Group {
          if getTitle() == "日付" {
            DatePicker(selection: $sheduleVM.editingShedule.dateDeadLine, displayedComponents: type == "date" ? .date : .hourAndMinute) {
              Text("")
            }.labelsHidden()
          } else {
            DatePicker(selection: $sheduleVM.editingShedule.timeDeadLine, displayedComponents: type == "date" ? .date : .hourAndMinute) {
              Text("")
            }.labelsHidden()
          }

        }.modifier(InputModifier())
        Spacer().frame(height: 24)
      }
    }
  }
}
