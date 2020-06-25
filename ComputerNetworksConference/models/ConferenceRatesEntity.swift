//
//  ConferenceRatesEntity.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class ConferenceRatesEntity: Object {
    @objc dynamic var conferenceRateId : Int = 0
    @objc dynamic var conferenceRateDescription : String?
    @objc dynamic var value : Int = 0
    @objc dynamic var conferenceRaitingId : Int = 0
    @objc dynamic var conferenceRateCriterionId : Int = 0
    
    convenience init(conferenceRateDescription : String?, value : Int){
        self.init()
        self.conferenceRateDescription = conferenceRateDescription
        self.value = value
    }
    
    override static func primaryKey() -> String? {
        return "conferenceRateId"
    }
}
