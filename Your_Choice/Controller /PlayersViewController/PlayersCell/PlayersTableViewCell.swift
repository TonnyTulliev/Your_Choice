//
//  PlayersTableViewCell.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 09.12.2021.
//

import Foundation
import UIKit

class PlayersTableViewCell : UITableViewCell {
    
    
    var nameText = ""
        
    var textField : UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Введите ваше имя"
        textfield.textAlignment = .center
        textfield.backgroundColor = .white
        textfield.borderStyle = .none
        textfield.minimumFontSize = 18
        return textfield
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(textField)
        textField.frame = bounds
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


