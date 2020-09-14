//
//  TextFieldComponent.swift
//  SwiftUIPrograming
//
//  Created by 開発 on 2020/08/21.
//  Copyright © 2020 開発. All rights reserved.
//

import SwiftUI

struct TextFieldParts: View {
  @State var title: String
  @EnvironmentObject var sheduleVM: SheduleViewModel

  var body: some View {
    VStack(alignment: .leading) {
      Text("メモのタイトル").font(.headline)
      TextField(
        "メモを入力", text: $title,
        onEditingChanged: { _ in self.sheduleVM.editingShedule.title = self.title
          print("onEditingChanged: \(self.sheduleVM.editingShedule.title)")
        },
        onCommit: { self.sheduleVM.editingShedule.title = self.title
          print("ｓｆｄｓ: \(self.sheduleVM.editingShedule.title)")
        }
      )
      .padding(.all)
      .modifier(InputModifier())
      if !self.sheduleVM.validate_isThereTitle(title: title) {
        Text("※ " + "メモのタイトルを入力してください。")
          .font(.caption)
          .foregroundColor(Color.red)
      }
      if !self.sheduleVM.validate_isTitleLengthWithin30(title: title) {
        Text("※ " + "30字以内で入力してください。")
          .font(.caption)
          .foregroundColor(Color.red)
      }
    }
  }
}
