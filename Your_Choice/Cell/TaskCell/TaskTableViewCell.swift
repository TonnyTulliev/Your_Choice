//
//  TaskCell.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 15.01.2022.
//

import Foundation
import UIKit
import SnapKit

class TaskTableViewCell: UITableViewCell {
    
    private var taskImage: UIImageView = {
    let image = UIImageView()
        image.image = UIImage(systemName: "square.and.pencil")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.tintColor = .black
    return image
    }()
    
    private func addConstraints() {
        taskImage.snp.makeConstraints { taskImage in
            taskImage.centerY.equalTo(self.snp.centerY)
            taskImage.left.equalTo(self.snp.left).offset(20)
            taskImage.height.equalTo(40)
            taskImage.width.equalTo(40)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(taskImage)
        addConstraints()
        self.textLabel?.text = "Тестовая задача"
        self.textLabel?.textAlignment = .center
        self.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
