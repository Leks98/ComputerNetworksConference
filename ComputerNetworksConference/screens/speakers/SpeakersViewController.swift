//
//  SpeakersViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 4/19/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import Foundation
import UIKit

class SpeakersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var speakersTable: UITableView!
    
    @IBOutlet weak var modalBackground: UIView!
    @IBOutlet weak var speakerDetailsModal: UIView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        speakersTable.delegate = self
        speakersTable.dataSource = self
        speakerDetailsModal.layer.cornerRadius = 10
        speakerDetailsModal.layer.masksToBounds = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideSpeakerDetailsModal))
             modalBackground.addGestureRecognizer(gestureRecognizer)
             modalBackground.isUserInteractionEnabled = true
    }
    override func viewWillAppear(_ animated: Bool) {
    hideSpeakerDetailsModal()
    }
    func showSpeakerDetailsModal(){
        modalBackground.alpha = 1.0
        UIView.animate(withDuration: 0.5, animations: {
            self.speakerDetailsModal.alpha = 1.0
        })
    }
    @objc func hideSpeakerDetailsModal(){
        speakerDetailsModal.alpha = 0.0
        modalBackground.alpha = 0.0
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpeakersCell", for: indexPath)
        if let speakersCell = cell as? SpeakersCell {
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showSpeakerDetailsModal()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
