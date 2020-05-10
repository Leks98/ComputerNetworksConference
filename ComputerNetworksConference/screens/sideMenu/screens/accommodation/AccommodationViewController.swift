//
//  AccommodationViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 5/4/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import UIKit

class AccommodationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var accommodationTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccommodationCell", for: indexPath)
          if let accommodationCell = cell as? AccommodationCell {
          }
          return cell
               
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accommodationTableView.delegate = self
        accommodationTableView.dataSource = self
    }
    
}
