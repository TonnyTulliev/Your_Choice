//
//  GameTableViewCell.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 27.01.2022.
//

import Foundation
import UIKit
import SnapKit

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
    
    func setViewModel(_ viewModel: TaskCellViewModel) {
        self.viewModel = viewModel
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
