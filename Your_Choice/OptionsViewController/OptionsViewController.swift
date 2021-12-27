//
//  OptionsViewController.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 24.12.2021.
//

import Foundation
import UIKit

class OptionsViewControoler: UIViewController{
    
    var optionPlayersView = OptionsPlayersView()
    
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
        dismiss(animated: true, completion: nil)
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
