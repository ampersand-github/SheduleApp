//
//  InputModifier.swift
//  SwiftUIPrograming
//
//  Created by 開発 on 2020/08/22.
//  Copyright © 2020 開発. All rights reserved.
//

import SwiftUI

struct InputModifier: ViewModifier {
  var color: Color = Color(red: 239.0 / 255.0, green: 243.0 / 255.0, blue: 244.0 / 255.0, opacity: 1.0)

  func body(content: Content) -> some View {
    content
      .background(color).cornerRadius(16)
  }
}

struct InputModifier_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      Text("ssssss")
      Text("ssssss")
    }.modifier(InputModifier())
  }
}
