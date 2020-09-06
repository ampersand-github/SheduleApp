//
//  SampleViewModel.swift
//  SheduleApp
//
//  Created by 開発 on 2020/09/05.
//  Copyright © 2020 開発. All rights reserved.
//

import RealmSwift
import SwiftUI

class SampleViewModel: ObservableObject {
    // - - - - -
    // 表示するときは[model]で、書き込みなどのdb操作をする場合はrealm
    // - - - - -
    private var token: NotificationToken?
    private var modelResults = try? Realm().objects(SampleRealmModel.self)
    @Published var samples: [SampleModel] = []
      
    init() {
        token = modelResults?.observe { [weak self] _ in
            self?.samples = self?.modelResults?.map {
                SampleModel(id: $0.id, title: $0.title)
            } ?? []
        }
    }

    deinit {
        token?.invalidate()
    }

    func printAllData() {
        print("- - - - - ")
        print("- - - - - \(count())件のデータが存在します - - - - - ")
        for sample in samples {
            print(sample)
        }
    }

    func count() -> Int {
        return samples.count
    }

    func addRecord(string: String) {
        let realm = try? Realm()
        let model = SampleRealmModel()
        //
        model.title = string
        //
        try? realm?.write {
            realm?.add(model)
        }
    }

    func editRecord(id: String, title: String) {
        let realm = try? Realm()
        if let model = realm?.objects(SampleRealmModel.self).filter("id = %@", id).first {
            try? realm?.write {
                model.title = title
            }
        }
    }

    func deleteRecord(id: String) {
        let realm = try? Realm()
        if let model = realm?.objects(SampleRealmModel.self).filter("id = %@", id).first {
            try? realm?.write {
                realm?.delete(model)
            }
        }
    }
}
