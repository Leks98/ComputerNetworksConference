//
//  ConferenceRateCriterionsEntity.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class ConferenceRateCriterionsEntity: Object {
    @objc dynamic var conferenceRateCriterionId : Int = 0
    @objc dynamic var name : String?
    
    override static func primaryKey() -> String? {
        return "conferenceRateCriterionId"
    }
}
