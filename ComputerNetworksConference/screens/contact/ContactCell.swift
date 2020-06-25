//
//  ContactCell.swift
//  ComputerNetworksConference
//
//  Created by Michal on 5/10/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import Foundation
import UIKit

class ContactCell: UITableViewCell{
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var university: UILabel!
    
    @IBOutlet weak var number: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    func setCell(withEntity entity: OrganizersEntity){
        name.text = entity.name
        university.text = entity.university
        number.text = entity.number
        email.text = entity.email
    }
}
