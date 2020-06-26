//
//  SponsorsCell.swift
//  ComputerNetworksConference
//
//  Created by vagrant on 23/04/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import Foundation
import UIKit

class SponsorsCell : UITableViewCell {
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
    func setCell(withEntity entity: SponsorsEntity) {
        nameLabel.text = entity.name
        websiteLabel.text = entity.website
    }
}
