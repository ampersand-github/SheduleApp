//
//  TextFieldComponent.swift
//  SwiftUIPrograming
//
//  Created by 開発 on 2020/08/21.
//  Copyright © 2020 開発. All rights reserved.
//

import SwiftUI

struct TextFieldParts: View {
  @Binding var memoTitle: String
  var body: some View {
    VStack(alignment: .leading) {
      Text("メモのタイトル").font(.headline)
      TextField("メモを入力", text: $memoTitle)
        .padding(.all)
        .modifier(InputModifier())
      if self.memoTitle.count == 0 {
        Text("※" + "メモのタイトルを入力してください。").font(.caption).foregroundColor(Color.red)
      }
    }
  }
}
