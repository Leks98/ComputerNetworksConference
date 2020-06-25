//
//  ServiceCell.swift
//  ComputerNetworksConference
//
//  Created by Michal on 4/14/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import UIKit

class EmergencyCell: UITableViewCell{
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var address: UILabel!
    
    func setCell(withEntity entity: EmergencyNumbersEntity) {
        name.text = entity.name
        number.text = entity.number
    }
    
    @IBAction func emergencyButtonPressed(_ sender: UIButton) {
        //TODO call number
    }
}
