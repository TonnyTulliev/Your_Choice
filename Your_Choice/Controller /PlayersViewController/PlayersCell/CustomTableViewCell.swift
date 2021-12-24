//
//  CustomTableViewCell.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 14.12.2021.
//

import Foundation
import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var textField : UITextField = UITextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.textField = UITextField()
        setConstraint()
        addElements()
        contentView.backgroundColor = .white
    }

    private func setConstraint(){
        textField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true 
    }
    
    private func addElements(){
        self.addSubview(self.textField)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
