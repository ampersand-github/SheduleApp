//
//  CheckBoxView.swift
//  SheduleApp
//
//  Created by 開発 on 2020/09/15.
//  Copyright © 2020 開発. All rights reserved.
//

import SwiftUI

struct CheckBoxParts: View {
  var shedule: SheduleModel
  @EnvironmentObject var todoVM: SheduleViewModel
  func toggle() { todoVM.toggle(id: shedule.id, isComplete: shedule.isComplete) }

  var body: some View {
    Image(systemName: self.shedule.isComplete ? "checkmark.square" : "square")
      .onTapGesture { self.toggle() }
  }
}
