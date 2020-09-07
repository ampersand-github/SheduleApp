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
  @Binding var date: Date
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
          DatePicker(selection: $date, displayedComponents: type == "date" ? .date : .hourAndMinute) {
            Text("")
          }.labelsHidden()
        }
      }.modifier(InputModifier())
      Spacer().frame(height: 24)
    }
  }
}
