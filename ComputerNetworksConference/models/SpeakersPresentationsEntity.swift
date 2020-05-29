//
//  SpeakersPresentationsEntity.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class SpeakersPresentationsEntity: Object {
    @objc dynamic var speakersPresentationId : Int = 0
    @objc dynamic var presentationId : Int = 0
    @objc dynamic var speakerId : Int = 0
    
    override static func primaryKey() -> String? {
        return "speakersPresentationId"
    }
}
