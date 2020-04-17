//
//  SideMenuViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 4/11/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import UIKit
import Foundation

class SideMenuViewController: UIViewController, SideMenuModalDelegate {
    func closeModal() {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
