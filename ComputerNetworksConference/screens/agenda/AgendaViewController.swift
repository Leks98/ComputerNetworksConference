//
//  AgendaViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 4/8/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import Foundation
import UIKit

class AgendaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var agendaTable: UITableView!

    
    @IBOutlet weak var sideMenuLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var sideMenuTrailingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var modalBackground: UIView!
    
    @IBOutlet weak var eventDetailsModal: UIView!
    var tab = [[13432422, 17423324], [8,10,12]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        agendaTable.delegate = self
        agendaTable.dataSource = self

        eventDetailsModal.layer.cornerRadius = 10
        eventDetailsModal.layer.masksToBounds = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideSideMenu))
             gestureRecognizer.addTarget(self, action: #selector(self.hideEventDetailsModal))
             modalBackground.addGestureRecognizer(gestureRecognizer)
             modalBackground.isUserInteractionEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hideSideMenu()
        hideEventDetailsModal()
    }
    func showSideMenu(){
        sideMenuLeadingConstraint.constant = 0
        sideMenuTrailingConstraint.constant = 90
        modalBackground.alpha = 1.0
        UIView.animate(withDuration: 1.0, animations: {
            self.view.layoutIfNeeded()
        })    }
    @objc func hideSideMenu(){
        let screenWidth = self.view.bounds.width
        sideMenuLeadingConstraint.constant = -screenWidth
        sideMenuTrailingConstraint.constant = 90 + screenWidth
        modalBackground.alpha = 0.0
    }
    func showEventDetailsModal(){
        modalBackground.alpha = 1.0
        UIView.animate(withDuration: 0.5, animations: {
            self.eventDetailsModal.alpha = 1.0
        })
    }
    @objc func hideEventDetailsModal(){
        eventDetailsModal.alpha = 0.0
        modalBackground.alpha = 0.0
    }
    @IBAction func sideMenuButtonPressed(_ sender: UIButton) {
        showSideMenu()
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
  showSideMenu()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showEventDetailsModal()
    }
    @IBAction func generalizedAgendaPressed(_ sender: Any) {
       
    }
    
   
    
}
