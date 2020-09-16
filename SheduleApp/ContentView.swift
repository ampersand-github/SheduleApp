//
//  ContentView.swift
//  SheduleApp
//
//  Created by 開発 on 2020/08/31.
//  Copyright © 2020 開発. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var index: Int = 0
  var body: some View {
    ZStack {
      VStack {
        TabView {
          SheduleView()
            .tabItem {
              VStack {
                Image(systemName: "square.and.pencil")
                Text("スケジュール")
              }
            }.tag(1)
          UserView()
            .tabItem {
              VStack {
                Image(systemName: "person.crop.circle")
                Text("設定")
              }
            }.tag(2)
        }
      }
      EditingFloatingActionButton()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
