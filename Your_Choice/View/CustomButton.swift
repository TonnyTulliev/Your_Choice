//
//  CustomButton.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 24.12.2021.
//

import Foundation
import UIKit

class CustomButton : UIButton{
    var customButton: UIButton = {
    let button = UIButton(type: .system)
    button.backgroundColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
    button.setTitle("Логин", for: .normal)
    button.titleLabel?.textAlignment = .center
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    button.tintColor = .white
    button.layer.cornerRadius = 25
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.shadowColor = UIColor.black.cgColor
    button.layer.shadowOffset = CGSize(width: 3, height: 3)
    button.layer.shadowOpacity = 0.7
    button.layer.shadowRadius = 6.0
    return button
    }()
}
  
    
    
   

