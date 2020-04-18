//
//  EmergencyViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 4/14/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import Foundation
import UIKit

class EmergencyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIViewControllerTransitioningDelegate {
    @IBOutlet weak var sideMenuLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var sideMenuTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var modalBackground: UIView!
    
    @IBOutlet weak var emergencyTable: UITableView!
    let transition = SlideInTransition()
    
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
        UIView.animate(withDuration: 3.0, animations: {
            self.view.layoutIfNeeded()
        })
        modalBackground.alpha = 1.0
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
    @IBAction func sideMenuButtonPressed(_ sender: UIButton) {
        showSideModal()
        /*guard let sideMenuViewController = storyboard?.instantiateViewController(identifier: "SideMenuViewController") else {return}
        sideMenuViewController.modalPresentationStyle = .overCurrentContext
        sideMenuViewController.transitioningDelegate = self
        present(sideMenuViewController, animated: true)*/
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
