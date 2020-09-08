//
//  TodoModel.swift
//  SwiftUIPrograming
//
//  Created by 開発 on 2020/08/14.
//  Copyright © 2020 開発. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftUI

struct SheduleModel: Identifiable {
  var id: String = ""
  var title: String = ""
  var dateDeadLine: Date = Date()
  var timeDeadLine: Date = Date()
  var isComplete: Bool = false
}

class SheduleRealmModel: Object {
  @objc dynamic var id = UUID().uuidString
  @objc dynamic var title: String = ""
  @objc dynamic var dateDeadLine: Date = Date()
  @objc dynamic var timeDeadLine: Date = Date()
  @objc dynamic var isComplete: Bool = false
}
