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
        case GlobalString.redColor:
            self.backgroundColor = #colorLiteral(red: 0.8465180397, green: 0.6758248806, blue: 0.7737604976, alpha: 1)
        case GlobalString.blueColor:
            self.backgroundColor = #colorLiteral(red: 0.281285584, green: 0.4995560646, blue: 0.7573058009, alpha: 1)
        case GlobalString.purpleColor:
            self.backgroundColor = #colorLiteral(red: 0.692247808, green: 0.6088116169, blue: 0.931736052, alpha: 1)
        case GlobalString.greenColor:
            self.backgroundColor = #colorLiteral(red: 0.7582806945, green: 0.8539865613, blue: 0.8737122416, alpha: 1)
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


