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
    
    func downloadImage(from url: URL) {
        photo.downloaded(from: "https://cdn.arstechnica.net/wp-content/uploads/2018/06/macOS-Mojave-Dynamic-Wallpaper-transition.jpg")
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

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
