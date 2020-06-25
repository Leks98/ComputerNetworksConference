//
//  BuildingViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 4/19/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class BuildingViewController: UIViewController {
    @IBOutlet weak var modalBackground: UIView!
    
    @IBOutlet weak var sideMenuLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var sideMenuTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var photo: UIImageView!
    
    private var buildingsPlansEntities: Results<BuildingsPlansEntity> {
         let conf = Realm.Configuration(schemaVersion: 1)
         let realm = try! Realm(configuration: conf)
         return realm.objects(BuildingsPlansEntity.self)
     }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideSideMenu))
                modalBackground.addGestureRecognizer(gestureRecognizer)
               modalBackground.isUserInteractionEnabled = true
    }
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.photo.image = UIImage(data: data)
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
       var entity = buildingsPlansEntities[0]
        let url = URL(string: buildingsPlansEntities[0].buildingsPlan ?? "")!
           downloadImage(from: url)
        
        
        hideSideMenu()
    }
    @IBAction func sideMenuButtonPressed(_ sender: UIButton) {
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
        sideMenuTrailingConstraint.constant = screenWidth + 90
        modalBackground.alpha = 0.0
    }
    
}
