//
//  CreateMemoView.swift
//  SwiftUIPrograming
//
//  Created by 開発 on 2020/08/21.
//  Copyright © 2020 開発. All rights reserved.
//

import SwiftUI

struct EditingView: View {
  @Binding var isPresented: Bool
  @State var todo: SheduleModel
  @EnvironmentObject var sheduleVM: SheduleViewModel
  var body: some View {
    NavigationView {
      ScrollView {
        VStack {
          Spacer().frame(height: 24)
          TextFieldParts()
          Spacer().frame(height: 16)
          DeadlineParts(type: "date")
          Spacer().frame(height: 16)
          DeadlineParts(type: "hour")
          Spacer().frame(height: 32)
          SubmitButtonParts(isPresented: self.$isPresented, opacity: 1.0)
          Spacer()
            .navigationBarTitle("メモを作成")
        }
      }
    }.padding(EdgeInsets(top: 24, leading: 16, bottom: 24, trailing: 16))
  }
}

struct EditingView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
