//
//  UsersTypesEntity.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class UsersTypesEntity: Object {
    @objc dynamic var typeId : Int = 0
    @objc dynamic var type : String?
    
    override static func primaryKey() -> String? {
        return "typeId"
    }
}
