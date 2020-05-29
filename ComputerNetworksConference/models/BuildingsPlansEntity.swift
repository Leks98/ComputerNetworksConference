//
//  Buildings_plans.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class BuildingsPlansEntity: Object {
    @objc dynamic var buildingsPlanId : Int = 0
    @objc dynamic var buildingsPlan : String?
    @objc dynamic var buildingsPlanDescription : String?
    @objc dynamic var name : String?
    @objc dynamic var conferenceId : Int = 0
    
    override static func primaryKey() -> String? {
        return "buildingsPlanId"
    }
}

