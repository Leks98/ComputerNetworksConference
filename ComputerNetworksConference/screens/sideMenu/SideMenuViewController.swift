//
//  SideMenuViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 4/11/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import UIKit
import Foundation

class SideMenuViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeSideMenu))
              backgroundView.addGestureRecognizer(gestureRecognizer)
              backgroundView.isUserInteractionEnabled = true
    }
    
    @objc func closeSideMenu() {
            // self.view.backgroundColor = UIColor.yellow
           //  sender.dismiss()
             dismiss(animated: true, completion: nil)
         
    }
}
