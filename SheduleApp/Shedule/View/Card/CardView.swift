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
  let today: Date = Calendar.current.startOfDay(for: Date())
  func setTargetDay(day: Date) -> Date { Calendar.current.startOfDay(for: day) }
  func toggle() { todoVM.toggle(id: shedule.id, isComplete: shedule.isComplete) }
  func edit() { isPresented = true }
  func calcDate() -> Int { Calendar.current.dateComponents([.day], from: today, to: shedule.dateDeadLine).day! }

  @State private var status = true
  var body: some View {
    HStack {
      VStack(alignment: .center) {
        EditIconButtonParts() // 作る

        Spacer().frame(height: 16)
        // TODO: Parts化
        Image(systemName: shedule.isComplete ? "checkmark.square" : "square")
          .onTapGesture { self.toggle() }
      }
      // - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  -
      VStack(alignment: .leading) {
        Text(self.shedule.title).font(.headline)
        Spacer().frame(height: 8)
        // TODO: Parts化
        HStack {
          Text(todoVM.dateFormatter.string(from: self.shedule.dateDeadLine))
          Text(todoVM.timeFormatter.string(from: self.shedule.timeDeadLine))
        }.font(.caption).opacity(0.6)
      }
      // - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  -
      Spacer()
      VStack(alignment: .trailing) {
        // TODO: Parts化
        if setTargetDay(day: self.shedule.dateDeadLine) == today {
          Text("締切日！").fontWeight(.black).foregroundColor(Color.orange).font(.caption)
        } else if setTargetDay(day: self.shedule.dateDeadLine) > today {
          Text("あと" + String(calcDate()) + "日").fontWeight(.bold).foregroundColor(Color.green).font(.caption).opacity(0.6)
        } else {
          Text(String(calcDate() + 1) + "日超過").fontWeight(.bold).foregroundColor(Color.red).font(.caption).opacity(0.6)
        }
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
