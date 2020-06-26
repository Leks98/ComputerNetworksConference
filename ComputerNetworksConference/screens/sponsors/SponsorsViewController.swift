//
//  SponsorsViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 4/19/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import UIKit
import RealmSwift

class SponsorsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var sponsorsTable: UITableView!
    private var sponsorEntities: Results<SponsorsEntity> {
        return GlobalVariables.realm.objects(SponsorsEntity.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sponsorsTable.delegate = self
        sponsorsTable.dataSource = self
    }
     
     func numberOfSections(in tableView: UITableView) -> Int {
         return 1
     }
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return sponsorEntities.count
     }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "SponsorsCell", for: indexPath)
         if let sponsorsCell = cell as? SponsorsCell {
            sponsorsCell.setCell(withEntity: sponsorEntities[indexPath.row])
         }
         return cell
     }
    
    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        UIApplication.shared.openURL(NSURL(string: "google.com")! as URL)
    }
  
}
