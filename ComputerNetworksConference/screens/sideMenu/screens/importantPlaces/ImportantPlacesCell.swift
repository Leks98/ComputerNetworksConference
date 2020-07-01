//
//  ImportantPlacesCell.swift
//  ComputerNetworksConference
//
//  Created by Michal on 5/7/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import Foundation
import UIKit

class ImportantPlacesCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    func setCell(withEntity entity: MedicalPointInformationEntity) {
        nameLabel.text = entity.name
        addressLabel.text = entity.address
        numberLabel.text = entity.number
    }
}
