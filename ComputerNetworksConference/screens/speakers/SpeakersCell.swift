//
//  SpeakersCell.swift
//  ComputerNetworksConference
//
//  Created by vagrant on 23/04/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import Foundation
import UIKit

class SpeakersCell : UITableViewCell {
    @IBOutlet weak var personalInfoLabel: UILabel!
    @IBOutlet weak var universityLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    
    func setCell(withEntity entity: SpeakersEntity) {
        universityLabel.text = entity.name
        if(universityLabel.text == nil) {
            universityLabel.text! += " "
            universityLabel.text! += entity.surname ?? ""
        } else {
            universityLabel.text = entity.surname
        }
        universityLabel.text = entity.company
    }
}
