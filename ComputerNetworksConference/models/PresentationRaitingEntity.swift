//
//  PresentationRaitingEntity.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class PresentationRaitingEntity: Object {
    @objc dynamic var presentationRaitingId : Int = 0
    @objc dynamic var presentationId : Int = 0
    @objc dynamic var userId : Int = 0
    
    override static func primaryKey() -> String? {
        return "presentationRaitingId"
    }
}
