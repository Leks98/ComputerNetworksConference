//
//  EmergencyViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 4/14/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class EmergencyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIViewControllerTransitioningDelegate {
    @IBOutlet weak var sideMenuLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var sideMenuTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var modalBackground: UIView!
    
    @IBOutlet weak var emergencyTable: UITableView!
    let transition = SlideInTransition()
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var number: UILabel!
    //TODO
    private var emergencyNumbersEntities: Results<EmergencyNumbersEntity> {
        let conf = Realm.Configuration(schemaVersion: 1)
        let realm = try! Realm(configuration: conf)
        return realm.objects(EmergencyNumbersEntity.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emergencyTable.delegate = self
        emergencyTable.dataSource = self
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideSideModal))
        modalBackground.addGestureRecognizer(gestureRecognizer)
        modalBackground.isUserInteractionEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hideSideModal()
    }
    
    @objc func hideSideModal() {
        let screenWidth = self.view.bounds.width
        sideMenuLeadingConstraint.constant = -screenWidth
        sideMenuTrailingConstraint.constant = screenWidth + 90
        modalBackground.alpha = 0.0
    }
    
    func showSideModal() {
        sideMenuLeadingConstraint.constant = 0
        sideMenuTrailingConstraint.constant = 90
        UIView.animate(withDuration: 1.0, animations: {
            self.view.layoutIfNeeded()
        })
        modalBackground.alpha = 1.0
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emergencyNumbersEntities.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmergencyCell", for: indexPath)
        if let emergencyCell = cell as? EmergencyCell {
            emergencyCell.setCell(withEntity: emergencyNumbersEntities[indexPath.row])
        }
        
        return cell
    }
    @IBAction func sideMenuButtonPressed(_ sender: UIButton) {
        showSideModal()
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }

}
