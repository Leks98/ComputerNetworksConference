//
//  ConferenceRaitingEntity.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class ConferenceRaitingEntity: Object {
    @objc dynamic var conferenceRaitingId : Int = 0
    @objc dynamic var conferenceId : Int = 0
    @objc dynamic var userId : Int = 0
    
    override static func primaryKey() -> String? {
        return "conferenceRaitingId"
    }
}
