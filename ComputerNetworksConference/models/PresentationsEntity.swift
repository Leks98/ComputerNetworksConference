//
//  Presentations.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class PresentationsEntity: Object {
    @objc dynamic var presentationId : Int = 0
    @objc dynamic var authors : String?
    @objc dynamic var date : Date?
    @objc dynamic var presentationDescription : String?
    @objc dynamic var endTime : String?
    @objc dynamic var place : String?
    @objc dynamic var startTime : String?
    @objc dynamic var title : String?
    @objc dynamic var conferenceId : Int = 0
    @objc dynamic var presentationTypeId : Int = 0
    
    
    override static func primaryKey() -> String? {
        return "presentationId"
    }
}
