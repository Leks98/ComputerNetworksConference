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

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var mainTable: UITableView!
    let transition = SlideInTransition()
    
    var tab = [[13, 17], [8,10,12]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTable.delegate = self
        mainTable.dataSource = self
        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: textLabel.bottomAnchor).isActive=true
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
        guard let sideMenuViewController = storyboard?.instantiateViewController(identifier: "SideMenuViewController") else {return}
        sideMenuViewController.modalPresentationStyle = .overCurrentContext
        sideMenuViewController.transitioningDelegate = self
        present(sideMenuViewController, animated: true)
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
