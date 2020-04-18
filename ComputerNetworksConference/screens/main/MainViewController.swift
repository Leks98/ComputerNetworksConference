//
//  ViewController.swift
//  ComputerNetworksConference
//
//  Created by vagrant on 19/03/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import UIKit

class MainViewController:
UIViewController, UITableViewDelegate, UITableViewDataSource, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var modalBackground: UIView!
    @IBOutlet weak var photoDetailsModal: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var mainTable: UITableView!
    var sideMenuDelegate: SideMenuModalDelegate?
    let transition = SlideInTransition()
    @IBOutlet weak var sideMenuContainerView: UIView!
    @IBOutlet weak var sideMenuTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var sideMenuLeadingConstraint: NSLayoutConstraint!
    var tab = [[13, 17], [8,10,12]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTable.delegate = self
        mainTable.dataSource = self
        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: textLabel.bottomAnchor).isActive=true
        photoDetailsModal.layer.cornerRadius = 10
        photoDetailsModal.layer.masksToBounds = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideSideMenu))
        modalBackground.addGestureRecognizer(gestureRecognizer)
        modalBackground.isUserInteractionEnabled = true
        UIView.animate(withDuration: 0.0, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hideSideMenu()
        hidePhotoDetailModal()
    }
    
    func roundButton(_ button: UIButton) {
        button.clipsToBounds = true
        button.layer.cornerRadius = CGFloat(10.0)
        button.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tab[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tab.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath)
        if let photoCell = cell as? PhotoCell {
            photoCell.photoTitle.text = "cell " + String(indexPath.row)
        }
        return cell
    }
    
    
    @IBAction func SideMenuButtonPressed(_ sender: UIButton) {
        showSideMenu()
        
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
    func showSideMenu(){
        sideMenuLeadingConstraint.constant = 0
        sideMenuTrailingConstraint.constant = 90
        modalBackground.alpha = 1.0
        UIView.animate(withDuration: 1.0, animations: {
            self.view.layoutIfNeeded()
        })
    }
    @objc func hideSideMenu(){
        let screenWidth = self.view.bounds.width
        sideMenuLeadingConstraint.constant = -screenWidth
        sideMenuTrailingConstraint.constant = 90 + screenWidth
        modalBackground.alpha = 0.0
        UIView.animate(withDuration: 1.0, animations: {
            self.view.layoutIfNeeded()
        })
    }
    func openPhotoDetailModal() {
        photoDetailsModal.alpha = 1.0
        modalBackground.alpha = 1.0
    }
    
    func hidePhotoDetailModal() {
        photoDetailsModal.alpha = 0.0
        modalBackground.alpha = 0.0
    }
    @objc func closeSideMenu(){
        sideMenuContainerView.alpha = 0.0
        modalBackground.alpha = 0.0
        photoDetailsModal.alpha = 0.0
    }
}
