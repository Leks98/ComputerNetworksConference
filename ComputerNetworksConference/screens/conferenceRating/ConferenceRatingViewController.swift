//
//  ConferenceRatingViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 4/19/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class ConferenceRatingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var StarPickerView: UIPickerView!
    let whiteStars = ["☆", "☆☆", "☆☆☆", "☆☆☆☆", "☆☆☆☆☆"]
    let blackStars = ["★", "★★", "★★★", "★★★★", "★★★★★"]
    var stars = ["★", "☆☆", "☆☆☆", "☆☆☆☆", "☆☆☆☆☆"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StarPickerView.dataSource = self
        StarPickerView.delegate = self
        saveButton.layer.cornerRadius = CGFloat(20.0)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stars.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return stars[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        for index in 0...4 {
            if index == row {
                stars[index] = blackStars[index]
            } else {
                stars[index] = whiteStars[index]
            }
        }
        StarPickerView.reloadComponent(component)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        
        let entity = ConferenceRatesEntity(conferenceRateDescription: nil, value: 0)
        
        entity.value = StarPickerView.selectedRow(inComponent: 0)
        
        try! GlobalVariables.realm.write{
            GlobalVariables.realm.add(entity)
        }
    }
}
