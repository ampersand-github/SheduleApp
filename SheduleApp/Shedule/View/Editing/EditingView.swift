//
//  CreateMemoView.swift
//  SwiftUIPrograming
//
//  Created by 開発 on 2020/08/21.
//  Copyright © 2020 開発. All rights reserved.
//

import SwiftUI

struct EditingView: View {
  // このviewが呼び出されたときにonAppear()が実行される。
  // onAppear()の中でeditingSheduleにsheduleをにいれている。
  // editingSheduleは一時的な作業用変数
  // 以下の子viewでも変更がある場合はeditingSheduleを変更する。
  // で、最後にeditingSheduleをsubmitする
  @Binding var isPresented: Bool
  @State var shedule: SheduleModel
  @EnvironmentObject var sheduleVM: SheduleViewModel
  func setEditingShedule() {
    sheduleVM.editingShedule = shedule
  }

  // TODO: レイアウト崩れ対応
  var body: some View {
    NavigationView {
      ScrollView(showsIndicators: false) {
        VStack {
          Spacer().frame(height: 24)
          TextFieldParts(title: shedule.title)
          Spacer().frame(height: 16)
          DeadlineParts(type: "date")
          Spacer().frame(height: 16)
          DeadlineParts(type: "hour")
          Spacer().frame(height: 32)
          SubmitButtonParts(isPresented: self.$isPresented, opacity: 1.0)
          Spacer()
            .navigationBarTitle("スケジュールを作成")
        }
      }
    }.padding(EdgeInsets(top: 24, leading: 16, bottom: 24, trailing: 16))
      .onAppear { self.setEditingShedule() } // ★viewDidLoadが呼び出されたときに関数を実行する
  }
}

struct EditingView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
