//
//  PlayersTableViewCell.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 09.12.2021.
//

import Foundation
import UIKit
import RealmSwift
import SnapKit

class PlayersTableViewCell : UITableViewCell {
   
    var player: PlayerRealm?
    
    private var personImage: UIImageView = {
    let image = UIImageView()
        image.image = UIImage(systemName: "person.fill")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
    return image
    }()
    
    func fetchData(player: PlayerRealm?){
        guard let player = player else { return }
        self.textLabel?.text = player.name
        self.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.textLabel?.textColor = .white
        switch player.color {
        case "red":
            self.backgroundColor = #colorLiteral(red: 0.7909195423, green: 0.3310045898, blue: 0.3346687257, alpha: 1)
        case "blue":
            self.backgroundColor = #colorLiteral(red: 0.3977680504, green: 0.4119620025, blue: 0.7987191081, alpha: 1)
        case "purple":
            self.backgroundColor = #colorLiteral(red: 0.4766717553, green: 0.2852187455, blue: 0.8323209882, alpha: 1)
        case "green":
            self.backgroundColor = #colorLiteral(red: 0.340542227, green: 0.6136100292, blue: 0.3587245941, alpha: 1)
        default:
            self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    private func addConstraints() {
        personImage.snp.makeConstraints { personImage in
            personImage.centerY.equalTo(self.snp.centerY)
            personImage.left.equalTo(self.snp.left).offset(20)
            personImage.height.equalTo(40)
            personImage.width.equalTo(40)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(personImage)
        addConstraints()
        self.textLabel?.textAlignment = .center
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


