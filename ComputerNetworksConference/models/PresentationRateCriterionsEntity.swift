//
//  PresentationRateCriterionsEntity.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class PresentationRateCriterionsEntity: Object {
    @objc dynamic var presentationRateCriterionId : Int = 0
    @objc dynamic var name : String?
    
    override static func primaryKey() -> String? {
        return "presentationRateCriterionId"
    }
}
