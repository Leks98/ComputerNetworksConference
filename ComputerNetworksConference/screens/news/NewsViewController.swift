//
//  ViewController.swift
//  ComputerNetworksConference
//
//  Created by vagrant on 19/03/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import UIKit
import RealmSwift

class NewsViewController:
UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var modalBackground: UIView!
    @IBOutlet weak var photoDetailsModal: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var mainTable: UITableView!
    var sideMenuDelegate: SideMenuModalDelegate?
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
        gestureRecognizer.addTarget(self, action: #selector(self.hidePhotoDetailModal))
        modalBackground.addGestureRecognizer(gestureRecognizer)
        modalBackground.isUserInteractionEnabled = true
        
        let conf = Realm.Configuration(schemaVersion: 1)
        let realm = try! Realm(configuration: conf)
        print(Realm.Configuration.defaultConfiguration.fileURL)
        /*try! realm.write {
            let pres = PresentationsEntity()
            pres.authors = "Mr Smith"
            pres.date = Date()
            pres.presentationDescription = ""
            pres.endTime = "21:00"
            pres.place = "Gliwice"
            pres.startTime = "19:30"
            pres.title = "Deep lerning in Python"
            
            realm.add(pres)
        }*/

    }
    
    override func viewWillAppear(_ animated: Bool) {
        hideSideMenu()
        hidePhotoDetailModal()
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showPhotoDetailModal()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func SideMenuButtonPressed(_ sender: UIButton) {
        showSideMenu()
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
    }
    func showPhotoDetailModal() {
        UIView.animate(withDuration: 0.5, animations: {
            self.photoDetailsModal.alpha = 1.0
        })
        modalBackground.alpha = 1.0
    }
    
    @objc func hidePhotoDetailModal() {
        photoDetailsModal.alpha = 0.0
        modalBackground.alpha = 0.0
    }
}
