//
//  ContactViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 4/19/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import Foundation
import UIKit

class ContactViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var contactTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        if let contactCell = cell as? ContactCell {
        }
        return cell
             
    }
    
  override func viewDidLoad(){
        super.viewDidLoad()
    contactTableView.delegate = self
    contactTableView.dataSource = self
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
          self.navigationController?.popViewController(animated: true)
    }
}
