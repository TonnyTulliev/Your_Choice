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
    var testNIk: PlayersViewController?
   
    
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
    
    @objc func done(){
        dismiss(animated: true){ [weak self] in
            guard let name = self?.optionPlayersView.name else { return }
            guard let color = self?.optionPlayersView.color else { return }
            let player = PlayerRealm()
            player.color = color
            player.name = name
            let realmObject = self?.realm.objects(PlayerRealm.self)
//            let player = Player(name: name, id: nil, color: color, task: [nil])
//            let realmPlayer = realmPlayer(value: player)
            try! self?.realm.write({
                self?.realm.add(player)
                print(realmObject as Any)
            })
            self?.testNIk?.playersCounts += 1
            self?.testNIk?.tableView.reloadData()
        }
    }
    
    @objc func exit(){
        dismiss(animated: true, completion: nil)
    }
    
    private func  addConstraints(){
        optionPlayersView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 60).isActive = true
        optionPlayersView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        optionPlayersView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        optionPlayersView.widthAnchor.constraint(equalToConstant: 350).isActive = true
    }
}
