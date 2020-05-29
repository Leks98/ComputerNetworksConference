//
//  Medical_points.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class MedicalPointsEntity: Object {
    @objc dynamic var medicalPointId : Int = 0
    @objc dynamic var category : String?
    
    override static func primaryKey() -> String? {
        return "medicalPointId"
    }
}
