//
//  SpeakersPhotos.swift
//  ComputerNetworksConference
//
//  Created by Ola on 29/05/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift

class SpeakersPhotosEntity: Object {
    @objc dynamic var speakerPhotoId : Int = 0
    @objc dynamic var photoPath : String?
    @objc dynamic var speakerId : Int = 0
    
    override static func primaryKey() -> String? {
        return "speakerPhotoId"
    }
}
