//
//  CardView.swift
//  SwiftUIPrograming
//
//  Created by 開発 on 2020/08/29.
//  Copyright © 2020 開発. All rights reserved.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
  func makeBody(configuration: Configuration) -> some View {
    return HStack {
      configuration.label
      Spacer()
      Image(systemName: configuration.isOn ? "checkmark.square" : "square")
        .resizable()
        .frame(width: 22, height: 22)
        .onTapGesture { configuration.isOn.toggle() }
    }
  }
}

struct CardView: View {
  @EnvironmentObject var todoVM: SheduleViewModel
  var todo: SheduleModel
  let today: Date = Calendar.current.startOfDay(for: Date())
  func setTargetDay(day: Date) -> Date { Calendar.current.startOfDay(for: day) }
  func toggle() {
    todoVM.toggle(id: todo.id, isComplete: todo.isComplete)
    print("toggle")
  }

  func edit() {
    print("edit")
  }

  @State private var status = true
  var body: some View {
    HStack {
      VStack(alignment: .center) {
        // TODO: 編集画面に飛ぶ
        Image(systemName: "square.and.pencil").onTapGesture {
          self.edit()
        }
        Spacer().frame(height: 16)
        Image(systemName: todo.isComplete ? "checkmark.square" : "square").onTapGesture {
          self.toggle()
        }
      }
      // - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  -
      VStack(alignment: .leading) {
        Text(self.todo.title).font(.headline)
        Spacer().frame(height: 8)
        HStack {
          Text(todoVM.dateFormatter.string(from: self.todo.dateDeadLine))
          Text(todoVM.timeFormatter.string(from: self.todo.timeDeadLine))
        }.font(.caption).opacity(0.6)
      }
      // - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  -
      Spacer()

      VStack(alignment: .trailing) {
        if setTargetDay(day: self.todo.dateDeadLine) == today {
          HStack {
            Text("締切日！").fontWeight(.black).foregroundColor(Color.orange).font(.caption)
          }
        } else if setTargetDay(day: self.todo.dateDeadLine) > today {
          Text("あと" +
            String(Calendar.current.dateComponents([.day], from: today, to: self.todo.dateDeadLine).day!)
            + "日"
          )
          .fontWeight(.bold).foregroundColor(Color.green).font(.caption).opacity(0.6)
        } else {
          Text(String(Calendar.current.dateComponents([.day], from: self.todo.dateDeadLine, to: today).day! + 1)
            + "日超過"
          ).fontWeight(.bold).foregroundColor(Color.red).font(.caption).opacity(0.6)
        }
        Spacer().frame(height: 8)
        Text("tag").font(.caption).opacity(0.6)
      }
      // - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  -
    }
    .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
    .background(
      self.todo.isComplete
        ? Color.gray
        : Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255)
    )
    .cornerRadius(16)
  }
}

struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    CardViewPreview(todoVM: SheduleViewModel(isSetDammy: true))
  }
}

struct CardViewPreview: View {
  @State var todoVM: SheduleViewModel

  var body: some View {
    ScrollView {
      VStack(spacing: 24) {
        ForEach(todoVM.todoList) { todo in
          CardView(todo: todo)
          Divider()
        }
      }
    }
  }
}
