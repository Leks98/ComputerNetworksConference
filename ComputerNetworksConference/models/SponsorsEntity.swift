//
//  Sponsors.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class SponsorsEntity: Object {
    @objc dynamic var sponsorsId : Int = 0
    @objc dynamic var address : String?
    @objc dynamic var country : String?
    @objc dynamic var sponsorsDescription : String?
    @objc dynamic var logo : String?
    @objc dynamic var name : String?
    @objc dynamic var number : String?
    @objc dynamic var website : String?
    
    override static func primaryKey() -> String? {
        return "sponsorsId"
    }
}
