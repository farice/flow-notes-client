//
//  RealmModels.swift
//  Flow-Notes
//
//  Created by Faris Sbahi on 12/26/17.
//  Copyright © 2017 Pauca, Inc. All rights reserved.
//

import RealmSwift

class RealmNote: Object {
    @objc dynamic var id = 0
    @objc dynamic var text = ""
    let adjList = List<RealmNote>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
