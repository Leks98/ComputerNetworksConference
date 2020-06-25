//
//  GlobalVariables.swift
//  ComputerNetworksConference
//
//  Created by Michal on 6/25/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

struct GlobalVariables {
    static var currentConferenceID: Int = {
        let conference = realm.objects(ConferenceEntity.self).filter("title == 'Computer Networks Conference'")
        return conference[0].conferenceId
    }()

    static let realm: Realm = {
        let conf = Realm.Configuration(schemaVersion: 1)
        return try! Realm(configuration: conf)
    }()
}
