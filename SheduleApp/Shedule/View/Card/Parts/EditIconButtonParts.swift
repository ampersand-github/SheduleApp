//
//  editIconButtonView.swift
//  SheduleApp
//
//  Created by 開発 on 2020/09/14.
//  Copyright © 2020 開発. All rights reserved.
//

import SwiftUI

struct EditIconButtonParts: View {
  var body: some View {
    Image(systemName: "square.and.pencil").onTapGesture {
      self.edit()
    }.sheet(isPresented: $isPresented) {
      EditingView(
        isPresented: self.$isPresented,
        shedule: self.shedule
      ).environmentObject(SheduleViewModel())
    }
  }
}
