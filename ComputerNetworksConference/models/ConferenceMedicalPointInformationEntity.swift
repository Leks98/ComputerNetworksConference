//
//  ConferenceMedicalPointInformationEntity.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class ConferenceMedicalPointInformationEntity: Object {
    @objc dynamic var conferenceMedicalPointInformationId : Int = 0
    @objc dynamic var conferenceId : Int = 0
    @objc dynamic var medicalPointInformationId : Int = 0
    
    override static func primaryKey() -> String? {
        return "conferenceMedicalPointInformationId"
    }
}
