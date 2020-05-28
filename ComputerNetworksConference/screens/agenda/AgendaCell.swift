//
//  TimetableCell.swift
//  ComputerNetworksConference
//
//  Created by vagrant on 09/04/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//
import UIKit
import Foundation

class AgendaCell: UITableViewCell {
    
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    
    private let formatter = DateFormatter()
    
    func setCell(withEntity entity: ConferenceEntity) {
        eventName.text = entity.title
        if let date = entity.startDate {
            formatter.dateStyle = .medium
            eventTime.text = formatter.string(from: date)
        }
    }
}
