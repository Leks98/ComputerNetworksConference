//
//  Users.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class UsersEntity: Object {
    @objc dynamic var userId : Int = 0
    @objc dynamic var nick : String?
    @objc dynamic var password : String?
    @objc dynamic var typeId : Int = 0
    
    override static func primaryKey() -> String? {
        return "userId"
    }
}
