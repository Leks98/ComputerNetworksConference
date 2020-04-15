//
//  EmergencyViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 4/14/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import Foundation
import UIKit

class EmergencyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var emergencyTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emergencyTable.delegate = self
        emergencyTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmergencyCell", for: indexPath)
        if let photoCell = cell as? EmergencyCell {
        }
        return cell
    }
}
