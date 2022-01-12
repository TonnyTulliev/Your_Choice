//
//  PlayersTableViewCell.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 09.12.2021.
//

import Foundation
import UIKit
import RealmSwift

class PlayersTableViewCell : UITableViewCell {
   
    var player: PlayerRealm?
    
    func fetchData(player: PlayerRealm?){
        guard let player = player else { return }
        self.textLabel?.text = player.name
        self.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        switch player.color {
        case "red":
            self.backgroundColor = #colorLiteral(red: 1, green: 0.04556197673, blue: 0.09580480307, alpha: 1)
        case "blue":
            self.backgroundColor = #colorLiteral(red: 0, green: 0.2113227248, blue: 0.9904268384, alpha: 1)
        case "purple":
            self.backgroundColor = #colorLiteral(red: 0.4302968681, green: 0.07698533684, blue: 1, alpha: 1)
        case "green":
            self.backgroundColor = #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)
        default:
            self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.textLabel?.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


