//
//  InputView.swift
//  SwiftUIPrograming
//
//  Created by 開発 on 2020/08/15.
//  Copyright © 2020 開発. All rights reserved.
//

import SwiftUI

struct InputParts: View {
  @State private var string: String = ""
  @ObservedObject var todoVM: TodoViewModel
  var body: some View {
    TextField(
      "メモを入力",
      text: $string,
      onCommit: {
        self.string = ""
      }
    )
  }
}

struct InputView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
