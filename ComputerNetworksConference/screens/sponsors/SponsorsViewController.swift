//
//  SponsorsViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 4/19/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import Foundation
import UIKit

class SponsorsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var sponsorsTable: UITableView!
 
     var tab = [[13, 17], [8,10,12]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sponsorsTable.delegate = self
        sponsorsTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return tab[section].count
     }
     
     func numberOfSections(in tableView: UITableView) -> Int {
         return tab.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "SponsorsCell", for: indexPath)
         if let sponsorsCell = cell as? SponsorsCell {
        
         }
         return cell
     }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        UIApplication.shared.openURL(NSURL(string: "google.com")! as URL) }
  
}
