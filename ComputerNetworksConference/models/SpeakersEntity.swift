//
//  Speakers.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class SpeakersEntity: Object {
    @objc dynamic var speakerId : Int = 0
    @objc dynamic var company : String?
    @objc dynamic var country : String?
    @objc dynamic var speakerDescription : String?
    @objc dynamic var name : String?
    @objc dynamic var surname : String?
    
    override static func primaryKey() -> String? {
        return "speakerId"
    }
}
