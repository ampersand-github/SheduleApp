//
//  TextFieldComponent.swift
//  SwiftUIPrograming
//
//  Created by 開発 on 2020/08/21.
//  Copyright © 2020 開発. All rights reserved.
//

import SwiftUI

struct TextFieldParts: View {
  @State private var title: String = ""
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
      // TODO: validateはvmへ
      /*
       if self.title.count == 0 {
              Text("※" + "メモのタイトルを入力してください。")
                .font(.caption)
                .foregroundColor(Color.red)
            }*/
    }
  }
}
