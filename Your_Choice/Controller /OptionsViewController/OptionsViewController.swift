//
//  OptionsViewController.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 24.12.2021.
//

import Foundation
import UIKit
import RealmSwift

class OptionsViewControoler: BaseViewController{
    
    let realm = try! Realm()
    var optionPlayersView = OptionsPlayersView()
    var playersVC: PlayersViewController?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.toolbar.isHidden = true
        view.backgroundColor = .clear
        optionPlayersView.doneButton.addTarget(self, action: #selector(done), for: .touchUpInside)
        optionPlayersView.exitButton.addTarget(self, action: #selector(exit), for: .touchUpInside)
        optionPlayersView.isHidden = false
        addElements()
        changePlayersState()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addConstraints()
    }

    private func  addElements(){
        view.addSubview(optionPlayersView)
    }
    
    private func savePlayerInRealm(){
        let name = optionPlayersView.name
        let color = optionPlayersView.color
        let player = PlayerRealm()
        player.color = color
        player.name = name
        try! self.realm.write({
            self.realm.add(player)
        })
    }
    
    private func changePlayersState(){
        let players = realm.objects(PlayerRealm.self)
        for i in players{
            getButtonColor(color: i.color)
        }
    }
    
    private func getButtonColor(color: String) {
        switch color {
        case "red":
            self.optionPlayersView.redButton.isEnabled = false
            self.optionPlayersView.redButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        case "blue":
            self.optionPlayersView.blueButton.isEnabled = false
            self.optionPlayersView.blueButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        case "purple":
            self.optionPlayersView.purpleButton.isEnabled = false
            self.optionPlayersView.purpleButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        case "green":
            self.optionPlayersView.greenButton.isEnabled = false
            self.optionPlayersView.greenButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            
        default: break
        }
    }
    
    @objc private func done(){
        savePlayerInRealm()
        self.playersVC?.tableView.reloadData()
        self.playersVC?.showAndHidePlayersImage()
        dismiss(animated: true)
    }
    
    @objc private func exit(){
        dismiss(animated: true, completion: nil)
    }
    
    private func  addConstraints(){
        optionPlayersView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 60).isActive = true
        optionPlayersView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        optionPlayersView.heightAnchor.constraint(equalToConstant: 470).isActive = true
        optionPlayersView.widthAnchor.constraint(equalToConstant: 350).isActive = true
    }
}
