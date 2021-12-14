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

        self.textField = UITextField(frame: CGRect(x: 119.00, y: 9, width: 216.00, height: 31.00));
        self.addSubview(self.textField)
        
        contentView.backgroundColor = .white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
