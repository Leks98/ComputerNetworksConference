//
//  ConferenceEntity.swift
//  ComputerNetworksConference
//
//  Created by Michal on 5/28/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class ConferenceEntity: Object {
    @objc dynamic var conferenceId : Int = 0
    @objc dynamic var address : String?
    @objc dynamic var country : String?
    @objc dynamic var confDescription : String?
    @objc dynamic var endDate : Date?
    @objc dynamic var startDate : Date?
    @objc dynamic var title : String?
    @objc dynamic var youtubeLink : String?
    
    override static func primaryKey() -> String? {
        return "conferenceId"
    }
}
