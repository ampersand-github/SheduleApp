//
//  SampleModel.swift
//  SheduleApp
//
//  Created by 開発 on 2020/09/05.
//  Copyright © 2020 開発. All rights reserved.
//

import RealmSwift
import SwiftUI

class SampleRealmModel: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var title = "ss"
}

struct SampleModel {
    let id: String
    let title: String
}
