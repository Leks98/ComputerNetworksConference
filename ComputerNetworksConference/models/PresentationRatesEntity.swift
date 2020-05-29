//
//  PresentationRatesEntity.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class PresentationRatesEntity: Object {
    @objc dynamic var presentationRateId : Int = 0
    @objc dynamic var presentationRateDescription : String?
    @objc dynamic var value : Int = 0
    @objc dynamic var presentationRatingId : Int = 0
    @objc dynamic var presentationRateCriterionId = 0
    override static func primaryKey() -> String? {
        return "presentationRateId"
    }
}
