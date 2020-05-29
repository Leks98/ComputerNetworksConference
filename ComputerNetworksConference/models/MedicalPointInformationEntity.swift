//
//  MedicalPointInformationEntity.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class MedicalPointInformationEntity: Object {
    @objc dynamic var medicalPointInformationId : Int = 0
    @objc dynamic var address : String?
    @objc dynamic var name : String?
    @objc dynamic var number : String?
    @objc dynamic var medicalPointId : Int = 0

    override static func primaryKey() -> String? {
        return "medicalPointInformationId"
    }
}
