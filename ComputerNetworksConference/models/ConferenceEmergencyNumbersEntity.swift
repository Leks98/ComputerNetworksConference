//
//  ConferenceEmergencyNumbers.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class ConferenceEmergencyNumbersEntity: Object {
    @objc dynamic var conferenceEmergencyNumberId : Int = 0
    @objc dynamic var conferenceId : Int = 0
    @objc dynamic var emergencyNumberId : Int = 0
    
    override static func primaryKey() -> String? {
        return "conferenceEmergencyNumberId"
    }
}

