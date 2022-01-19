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
    
    var task: TaskRealm?
    
    private var taskImage: UIImageView = {
    let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
    return image
    }()
    
    private func addConstraints() {
        taskImage.snp.makeConstraints { taskImage in
            taskImage.centerY.equalTo(self.snp.centerY)
            taskImage.left.equalTo(self.snp.left).offset(20)
            taskImage.height.equalTo(45)
            taskImage.width.equalTo(45)
        }
    }
    
    func fetchData(task: TaskRealm?){
        guard let task = task else { return }
        taskImage.image = UIImage(named: task.category)
        self.textLabel?.text = task.taskName
        self.textLabel?.textAlignment = .center
        self.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    func getColorForBackground(color: UIColor){
        self.backgroundColor = color
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(taskImage)
        addConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
