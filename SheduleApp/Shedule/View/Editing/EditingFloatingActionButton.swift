//
//  FloatingActionButton.swift
//  SwiftUIPrograming
//
//  Created by 開発 on 2020/08/16.
//  Copyright © 2020 開発. All rights reserved.
//

import SwiftUI

struct EditingFloatingActionButton: View {
  @State private var isPresented = false
  @EnvironmentObject var todo: TodoViewModel

  var body: some View {
    VStack {
      Spacer()
      HStack {
        Button(action: {
          self.isPresented = true
        }, label: {
          Image(systemName: "plus")
            .foregroundColor(.white)
            .font(.system(size: 40))
            .frame(width: 56, height: 56) // 選択領域をオレンジ円と同じにする
        })
          .frame(width: 56, height: 56)
          .background(Color.orange)
          .cornerRadius(48.0)
          .shadow(color: .gray, radius: 3, x: 3, y: 3)
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 24, trailing: 16.0)) // --- 5
      }.sheet(isPresented: $isPresented) {
        EditingView(
          isPresented: self.$isPresented,
          todo: TodoModel()
        ).environmentObject(TodoViewModel())
      }
    }
  }
}

struct EditingFloatingActionButton_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
