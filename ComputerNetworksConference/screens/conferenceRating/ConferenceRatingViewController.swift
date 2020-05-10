//
//  ConferenceRatingViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 4/19/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import Foundation
import UIKit

class ConferenceRatingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    @IBOutlet weak var StarPickerView: UIPickerView!
    let whiteStars = ["☆", "☆☆", "☆☆☆", "☆☆☆☆", "☆☆☆☆☆"]
    let blackStars = ["★", "★★", "★★★", "★★★★", "★★★★★"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return whiteStars.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let selectedRow = pickerView.selectedRow(inComponent: 0)
        if selectedRow == row {
            return blackStars[row]
        } else {
            return whiteStars[row]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StarPickerView.dataSource = self
        StarPickerView.delegate = self
    }
}
