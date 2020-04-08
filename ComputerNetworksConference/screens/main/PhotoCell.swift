//
//  PhotoCell.swift
//  ComputerNetworksConference
//
//  Created by Michal on 4/7/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import UIKit
import Foundation

class PhotoCell: UITableViewCell {
    
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var photoTitle: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
    }
}
