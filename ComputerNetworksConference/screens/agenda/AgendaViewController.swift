//
//  AgendaViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 4/8/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import Foundation
import UIKit

class AgendaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var agendaTable: UITableView!
    
    var tab = [[13432422, 17423324], [8,10,12]]
    
    override func viewDidLoad() {
           super.viewDidLoad()
           agendaTable.delegate = self
           agendaTable.dataSource = self
          
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tab[section].count
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
           return tab.count
       }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "AgendaCell", for: indexPath)
           if let agendaCell = cell as? AgendaCell {
            agendaCell.eventName.text = "cell " + String(indexPath.row)
            
            agendaCell.eventTime.text = "cell " + String(indexPath.row)
           }
           return cell
       }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AgendaHeaderCell")
        if let agendaHeaderCell = cell as? AgendaHeaderCell {
            agendaHeaderCell.eventData.text = "1.02.2090"
        }
       
        return cell
    }
   
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return (tableView.dequeueReusableCell(withIdentifier: "AgendaHeaderCell")?.bounds.height)!
    }
    
    
    @IBAction func sideMenuButttonPressed(_ sender: Any) {
    }
    @IBAction func generalizedAgendaPressed(_ sender: Any) {
    }
    
}
