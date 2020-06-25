//
//  ContactViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 4/19/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class ContactViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var contactTableView: UITableView!
    
    //TODO
    private var organizersEntities: Results<OrganizersEntity> {
        let conf = Realm.Configuration(schemaVersion: 1)
        let realm = try! Realm(configuration: conf)
        return realm.objects(OrganizersEntity.self)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
      
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return organizersEntities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        if let contactCell = cell as? ContactCell { contactCell.setCell(withEntity: organizersEntities[indexPath.row])
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
