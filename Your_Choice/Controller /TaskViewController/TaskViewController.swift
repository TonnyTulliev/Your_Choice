//
//  TaskViewController.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 13.01.2022.
//

import Foundation
import UIKit
import SnapKit
import RealmSwift

class TaskViewController: UIViewController{
    
    private var taskImage: UIImageView = {
        var image = UIImageView()
         image.translatesAutoresizingMaskIntoConstraints = false
         image.image = UIImage(named: "Tasks")
         image.contentMode = .scaleAspectFill
         return image
     }()
    
    private var tableView: UITableView = {
        var tableView = UITableView()
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.layer.borderWidth = 4
        tableView.layer.borderColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        tableView.layer.cornerRadius = 15
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    private var addTaskButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Добавить задание", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        button.tintColor = .white
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 0.6
        button.layer.shadowRadius = 4.0
        button.addTarget(self, action: #selector(addTask), for: .touchUpInside)
        return button
    }()
    
    private var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Далее", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        button.tintColor = .white
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 0.6
        button.layer.shadowRadius = 4.0
        button.addTarget(self, action: #selector(goNext), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        addElements()
        addConstraints()
    }
    
    @objc private func addTask() {
        
    }
    
    @objc private func goNext() {
        
    }
    
    private func config() {
        view.backgroundColor = .white
    }
    
    private func addElements() {
        view.addSubview(tableView)
        view.addSubview(taskImage)
        view.addSubview(addTaskButton)
        view.addSubview(nextButton)
    }
    private func addConstraints() {
        taskImage.snp.makeConstraints { taskImage in
            taskImage.top.equalTo(view.snp.top).offset(90)
            taskImage.centerX.equalTo(view.snp.centerX)
            taskImage.height.equalTo(80)
            taskImage.width.equalTo(250)
        }
        tableView.snp.makeConstraints { tableView in
            tableView.top.equalTo(taskImage.snp.bottom).offset(20)
            tableView.bottom.equalTo(addTaskButton.snp.top).offset(-20)
            tableView.left.equalTo(view.snp.left).offset(10)
            tableView.right.equalTo(view.snp.right).offset(-10)
//            tableView.height.equalTo(250)
        }
        nextButton.snp.makeConstraints { nextButton in
            nextButton.bottom.equalTo(view.snp.bottom).offset(-50)
            nextButton.centerX.equalTo(view.snp.centerX)
            nextButton.height.equalTo(55)
            nextButton.width.equalTo(250)
        }
        addTaskButton.snp.makeConstraints { addTaskButton in
            addTaskButton.bottom.equalTo(nextButton.snp.top).offset(-20)
            addTaskButton.centerX.equalTo(view.snp.centerX)
            addTaskButton.height.equalTo(55)
            addTaskButton.width.equalTo(250)
        }
        
    }
}
