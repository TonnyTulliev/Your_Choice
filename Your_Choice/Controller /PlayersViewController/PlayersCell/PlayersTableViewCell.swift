//
//  PlayersTableViewCell.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 09.12.2021.
//

import Foundation
import UIKit

class PlayersTableViewCell : UITableViewCell {
    
    var view = UIView()
    static let heightCell = 60
    static let reuseID = "PlayersTableViewCell"
    
   
    
    var label: UILabel = {
        var label = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: heightCell ))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    private var nextButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 60))
        button.setTitle("плюс", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        
       
        button.translatesAutoresizingMaskIntoConstraints = false
       
        return button
   }()
    private var mainTextField: UITextField = {
        var textfield = UITextField(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.borderWidth = 2.0
        textfield.layer.borderColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        textfield.backgroundColor = #colorLiteral(red: 0.9697982669, green: 0.9640328288, blue: 0.9742299914, alpha: 1)
        textfield.layer.cornerRadius = 15
        textfield.placeholder = "Введите имя игрока"
        textfield.returnKeyType = .done
        textfield.textAlignment = .center
        return textfield
    }()
    
}
