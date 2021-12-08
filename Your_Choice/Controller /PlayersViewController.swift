//
//  PlayersViewController.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 08.12.2021.
//

import Foundation
import UIKit

class PlayersViewController: BaseViewController {
    
//
//    var mainLabel: UILabel = {
//        var label = UILabel()
//        label.text = ""
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.layer.borderWidth = 2.0
//        label.layer.borderColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
//        label.backgroundColor = #colorLiteral(red: 0.9697982669, green: 0.9640328288, blue: 0.9742299914, alpha: 1)
//        label.layer.cornerRadius = 15
//
//        return label
//    }()
    
    var mainTextField: UITextField = {
        var textfield = UITextField()
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.borderWidth = 2.0
        textfield.layer.borderColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        textfield.backgroundColor = #colorLiteral(red: 0.9697982669, green: 0.9640328288, blue: 0.9742299914, alpha: 1)
        textfield.layer.cornerRadius = 15
        textfield.placeholder = "Введите имя игрока"
        textfield.returnKeyType = .done
        return textfield
    }()
    
    var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Назад", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        button.tintColor = .white
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(actionFornextButton), for: .allTouchEvents)
        
        return button
   }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        navigationItem.title = "Количество игроков" 
        addElementsToView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        mainTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        mainTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        mainTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        mainTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        mainTextField.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        nextButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        nextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        nextButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        
    }
    @objc private func actionFornextButton() {
        
    }
    
    private func addElementsToView() {
        view.addSubview(mainTextField)
        view.addSubview(nextButton)
    }
}
