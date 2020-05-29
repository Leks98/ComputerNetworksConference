//
//  Presentation_types.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class PresentationTypesEntity: Object {
    @objc dynamic var presentationTypeId : Int = 0
    @objc dynamic var presentationTypeDescription : String?
    @objc dynamic var type : String?
   
    override static func primaryKey() -> String? {
        return "presentationTypeId"
    }
}
