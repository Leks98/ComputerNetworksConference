//
//  SpeakersViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 4/19/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class SpeakersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var speakersTable: UITableView!
    
    @IBOutlet weak var modalBackground: UIView!
    @IBOutlet weak var speakerDetailsModal: UIView!
    @IBOutlet weak var PhotoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var universityLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
//    private var speakerPresentationEntities: Results<SpeakersPresentationsEntity> {
//        return GlobalVariables.realm.objects(SpeakersPresentationsEntity.self).filter("conferenceId == %@", GlobalVariables.currentConferenceID)
//    }
    
    private var speakerEntities: Results<SpeakersEntity> {
        return GlobalVariables.realm.objects(SpeakersEntity.self)
    }
    
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
        return speakerEntities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpeakersCell", for: indexPath)
        if let speakersCell = cell as? SpeakersCell {
            speakersCell.setCell(withEntity: speakerEntities[indexPath.row])
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        setModal(withEntity: speakerEntities[indexPath.row])
        showSpeakerDetailsModal()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func setModal(withEntity entity: SpeakersEntity) {
        nameLabel.text = entity.name
        if(nameLabel.text != nil) {
            nameLabel.text! += " "
            nameLabel.text! += entity.surname ?? ""
        } else {
            nameLabel.text = entity.surname
        }
        universityLabel.text = entity.company
        //emailLabel.text = entity.

    }
}
