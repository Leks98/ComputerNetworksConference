//
//  ContactViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 4/19/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import Foundation
import UIKit

class ContactViewController: UIViewController {
  override func viewDidLoad(){
        super.viewDidLoad()
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
          self.navigationController?.popViewController(animated: true)
    }
}
