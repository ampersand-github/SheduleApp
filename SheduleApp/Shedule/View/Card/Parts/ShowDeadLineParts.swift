//
//  ShowDeadLineParts.swift
//  SheduleApp
//
//  Created by 開発 on 2020/09/15.
//  Copyright © 2020 開発. All rights reserved.
//

import SwiftUI

struct ShowDeadLineParts: View {
  var shedule: SheduleModel
  let today: Date = Calendar.current.startOfDay(for: Date())
  func setTargetDay(day: Date) -> Date { Calendar.current.startOfDay(for: day) }
  func calcDate() -> Int { Calendar.current.dateComponents([.day], from: today, to: shedule.dateDeadLine).day! }
  @EnvironmentObject var todoVM: SheduleViewModel
  var body: some View {
    Group {
      if shedule.isComplete {
        Text("完了").fontWeight(.black).foregroundColor(Color.green).font(.caption)
      } else if setTargetDay(day: self.shedule.dateDeadLine) == today {
        Text("締切日！").fontWeight(.black).foregroundColor(Color.orange).font(.caption)
      } else if setTargetDay(day: self.shedule.dateDeadLine) > today {
        Text("あと" + String(calcDate()) + "日").fontWeight(.bold).foregroundColor(Color.green).font(.caption).opacity(0.6)
      } else {
        Text(String(abs(calcDate() - 1)) + "日超過").fontWeight(.bold).foregroundColor(Color.red).font(.caption).opacity(0.6)
      }
    }
  }
}
