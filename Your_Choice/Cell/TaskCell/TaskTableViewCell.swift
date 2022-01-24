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
    
    var task: TaskRealmBase?
    static let reuseID = String(describing: self)
    
    var viewModel: TaskCellViewModel? {
        didSet{
            guard let viewModel = viewModel else { return }
            contentView.backgroundColor = viewModel.isSelected ? #colorLiteral(red: 0.4940527678, green: 0.7641897798, blue: 0.4149656594, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.textLabel?.text = viewModel.taskText
            taskImage.image = UIImage(named: viewModel.taskType)
            layoutIfNeeded()
        }
    }
    
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        viewModel = nil
    }
    
    func setViewModel(_ viewModel: TaskCellViewModel) {
        self.viewModel = viewModel
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(taskImage)
        self.textLabel?.textAlignment = .center
        self.textLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
