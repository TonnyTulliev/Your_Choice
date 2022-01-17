//
//  OptionsViewController.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 24.12.2021.
//

import Foundation
import UIKit
import RealmSwift

class OptionsViewControoler: UIViewController{
    
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
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addConstraints()
    }

    private func  addElements(){
        view.addSubview(optionPlayersView)
    }
    
    @objc private func done(){
        let name = optionPlayersView.name
        let color = optionPlayersView.color
        let player = PlayerRealm()
        player.color = color
        player.name = name
        try! self.realm.write({
            self.realm.add(player)
        })
        self.playersVC?.tableView.reloadData()
        dismiss(animated: true)
    }
    
    @objc private func exit(){
        dismiss(animated: true, completion: nil)
    }
    
    private func  addConstraints(){
        optionPlayersView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 60).isActive = true
        optionPlayersView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        optionPlayersView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        optionPlayersView.widthAnchor.constraint(equalToConstant: 350).isActive = true
    }
}
