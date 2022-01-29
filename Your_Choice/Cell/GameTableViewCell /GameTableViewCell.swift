//
//  GameTableViewCell.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 27.01.2022.
//

import Foundation
import UIKit
import SnapKit
import RealmSwift

class GameTableViewCell: UITableViewCell {
    
    static let reuseID = String(describing: self)
    
    var viewModel : TaskCellViewModel? {
        didSet{
            guard let viewModel = viewModel else { return }
            self.textLabel?.text = viewModel.taskText
            taskImage.image = UIImage(named: viewModel.taskType)
            
            
        }
    }
    
    private var taskImage: UIImageView = {
    let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
    return image
    }()
    
    private func addConstraints() {
        taskImage.snp.makeConstraints { taskImage in
            taskImage.centerY.equalTo(self.snp.centerY)
            taskImage.left.equalTo(self.snp.left).offset(20)
            taskImage.height.equalTo(50)
            taskImage.width.equalTo(50)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        viewModel = nil
    }
    
    private func setColor(color: String) {
        switch color{
        case "red":
            self.backgroundColor = #colorLiteral(red: 0.8465180397, green: 0.6758248806, blue: 0.7737604976, alpha: 0.5)
        case "blue":
            self.backgroundColor = #colorLiteral(red: 0.281285584, green: 0.4995560646, blue: 0.7573058009, alpha: 0.5)
        case "purple":
            self.backgroundColor = #colorLiteral(red: 0.692247808, green: 0.6088116169, blue: 0.931736052, alpha: 0.5038545116)
        case "green":
            self.backgroundColor = #colorLiteral(red: 0.7582806945, green: 0.8539865613, blue: 0.8737122416, alpha: 0.5120033113)
        default:
            self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    func setViewModel(_ viewModel: TaskCellViewModel, section: Int, players: [PlayerRealm]) {
        self.viewModel = viewModel
        switch section {
        case 0:
            setColor(color: players[0].color)
        case 1:
            setColor(color: players[0].color)
            setColor(color: players[1].color)
        case 2:
            setColor(color: players[0].color)
            setColor(color: players[1].color)
            setColor(color: players[2].color)
        case 3:
            setColor(color: players[0].color)
            setColor(color: players[1].color)
            setColor(color: players[2].color)
            setColor(color: players[3].color)
        default:
            self.backgroundColor = UIColor(named: "white")
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(taskImage)
        self.bringSubviewToFront(taskImage)
        addConstraints()
        self.textLabel?.textAlignment = .center
        self.textLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
