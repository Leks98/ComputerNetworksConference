//
//  LocationViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 4/19/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import Foundation
import UIKit

class LocationTabBarViewController: UITabBarController {
    @IBOutlet weak var locationTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -17.0)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: 0.0)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame = CGRect(x: 0,y: 0,width: UIScreen.main.bounds.width,height: 50)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: 0.0)
        navigationController?.popViewController(animated: true)
    }
}
