//
//  Persons.swift
//  Realm
//
//  Created by sinbad on 4/16/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import Foundation 
import RealmSwift
class Persons: Object {
    @objc dynamic var name = ""
    @objc dynamic var address = ""
    @objc dynamic var city = ""
}
