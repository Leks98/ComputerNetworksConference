//
//  Emergency_numbers.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class EmergencyNumbersEntity: Object {
    @objc dynamic var emergencyNumberId : Int = 0
    @objc dynamic var name : String?
    @objc dynamic var number : String?
  
    override static func primaryKey() -> String? {
        return "emergencyNumberId"
    }
}
