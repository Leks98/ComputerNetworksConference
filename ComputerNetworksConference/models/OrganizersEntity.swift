//
//  OrganizersEntity.swift
//  ComputerNetworksConference
//
//  Created by Ola on 25/06/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class OrganizersEntity: Object {
    @objc dynamic var organizerId : Int = 0
    @objc dynamic var name : String?
    @objc dynamic var university : String?
    @objc dynamic var number : String?
    @objc dynamic var email : String?
    
    override static func primaryKey() -> String? {
        return "organizerId"
    }
}
           
