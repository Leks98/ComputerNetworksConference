//
//  ImportantPlacesViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 5/4/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import Foundation
import UIKit

class ImportantPlacesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var importantPlacesTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "ImportantPlacesCell", for: indexPath)
               if let importantPlacesCell = cell as? ImportantPlacesCell {
               }
               return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        importantPlacesTableView.delegate = self
        importantPlacesTableView.dataSource = self
    }
    
}
