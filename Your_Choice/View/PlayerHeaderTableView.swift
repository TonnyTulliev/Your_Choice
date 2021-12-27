//
//  PlayerHeaderTableView.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 24.12.2021.
//

import Foundation
import UIKit
import SnapKit

class PlayerHeaderTableView: UITableViewHeaderFooterView {
    
   
    var label : UILabel = {
        var label = UILabel()
        label.text = "Игроки"
        label.font = UIFont(name: "Arial", size: 40)
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.contentMode = .center
        return label
    }()
    
    var favorites : UILabel = {
        var label = UILabel()
        label.text = "Выберите имя и цвет игрока"
        return label
    }()
    
    var centralView : UIView = {
        var view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.alpha = 0.5
        return view
    }()
    
    var bottomView : UIView = {
        var view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.alpha = 0.5
        return view
    }()
    
   var switcher: UISwitch =  {
        var switcher = UISwitch()
        switcher.setOn(false, animated: false)
        switcher.isHidden = true
        return switcher
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addSubview(label)
        self.addSubview(centralView)
        self.addSubview(bottomView)
        self.addSubview(favorites)
        self.addSubview(switcher)
        self.contentView.backgroundColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(10)
            make.bottom.equalTo(centralView.snp.top).offset(-12)
        }
        centralView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.left.equalTo(self.snp.left).offset(10)
            make.right.equalTo(self.snp.right).offset(-10)
            make.height.equalTo(1)
        }
        favorites.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(10)
            make.bottom.equalTo(switcher.snp.centerY)
            
        }
        switcher.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right).offset(-30)
            make.top.equalTo(centralView.snp.bottom).offset(12)
            make.bottom.equalTo(self.snp.bottom).offset(12)
           
        }
        bottomView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp.bottom)
            make.left.equalTo(self.snp.left).offset(10)
            make.right.equalTo(self.snp.right).offset(-10)
            make.height.equalTo(1)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    }
}
