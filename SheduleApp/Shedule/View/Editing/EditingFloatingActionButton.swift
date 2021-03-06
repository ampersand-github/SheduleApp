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
            .frame(width: 56, height: 56)
        })
          .frame(width: 56, height: 56)
          .background(Color.orange)
          .cornerRadius(48.0)
          .shadow(color: .gray, radius: 3, x: 3, y: 3)
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 24, trailing: 16.0))
      }.sheet(isPresented: $isPresented) {
        EditingView(
          isPresented: self.$isPresented,
          shedule: SheduleModel()
        ).environmentObject(SheduleViewModel())
      }
    }
  }
}
