//
//  SubmitButtonComponent.swift
//  SwiftUIPrograming
//
//  Created by 開発 on 2020/08/21.
//  Copyright © 2020 開発. All rights reserved.
//

import SwiftUI

struct SubmitButtonParts: View {
  @Binding var isPresented: Bool
  let opacity: Double
  @EnvironmentObject var sheduleVM: SheduleViewModel

func pushButton() {le(
  isPresented.toggle()
  if sheduleVM.isUpdate(id: sheduleVM.editingShedule.id) {
    sheduleVM.updateRecord(todo: sheduleVM.editingShedule)
  } else {
    sheduleVM.createRecord()
  }
}

func canSubmit() -> Bool {
  if !sheduleVM.validate_isThereTittitle: sheduleVM.editingShedule.title) { return false }
    if !sheduleVM.validate_isTitleLengthWithin30(title: sheduleVM.editingShedule.title) { return false }
    return true
  }

  var body: some View {
    Button(
      action: {
        self.pushButton()
      },
      label: { Text("    決定    ").bold().font(.body).foregroundColor(Color.white) }
    ).padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
      .background(RoundedRectangle(cornerRadius: 16, style: .continuous))
      .foregroundColor(Color.blue)
      .opacity(canSubmit() ? 1.0 : 0.38)
      .disabled(canSubmit() ? false : true)
  }
}
