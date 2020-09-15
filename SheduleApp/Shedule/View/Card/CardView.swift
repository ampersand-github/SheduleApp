//
//  CardView.swift
//  SwiftUIPrograming
//
//  Created by 開発 on 2020/08/29.
//  Copyright © 2020 開発. All rights reserved.
//

import SwiftUI

struct CardView: View {
  @EnvironmentObject var todoVM: SheduleViewModel
  @State private var isPresented = false
  var shedule: SheduleModel

  @State private var status = true
  var body: some View {
    HStack {
      VStack(alignment: .center) {
        EditIconButtonParts(isPresented: isPresented, shedule: shedule) // 作る
        Spacer().frame(height: 16)
        CheckBoxParts(shedule: shedule)
      }
      // - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  -
      VStack(alignment: .leading) {
        Text(self.shedule.title).font(.headline)
        Spacer().frame(height: 8)
        HStack {
          Text(todoVM.dateFormatter.string(from: self.shedule.dateDeadLine))
          Text(todoVM.timeFormatter.string(from: self.shedule.timeDeadLine))
        }.font(.caption).opacity(0.6)
      }
      // - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  -
      Spacer()
      VStack(alignment: .trailing) {
        ShowDeadLineParts(shedule: shedule)

        Spacer().frame(height: 8)
        // TODO: tagどうしよう
        // TODO: Parts化
        Text("tag").font(.caption).opacity(0.6)
      }
      // - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  -
    }
    .shadow(radius: 16, x: 8, y: 8)
    .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
    .background(
      self.shedule.isComplete
        ? Color.gray
        : Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255)
    )

    .cornerRadius(16)
  }
}
