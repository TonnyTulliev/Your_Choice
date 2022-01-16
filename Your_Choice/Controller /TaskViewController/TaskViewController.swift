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
        button.setTitle("Создать задание", for: .normal)
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
        addDelegate()
        registrationCell()
    }
    
    @objc private func addTask() {
        
    }
    
    @objc private func goNext() {
        
    }
    
    private func config() {
        view.backgroundColor = .white
        navigationItem.title = "Задания"
        tableView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    private func addElements() {
        view.addSubview(tableView)
        view.addSubview(taskImage)
        view.addSubview(addTaskButton)
        view.addSubview(nextButton)
    }
    private func addConstraints() {
        taskImage.snp.makeConstraints { taskImage in
            taskImage.bottom.equalTo(tableView.snp.top).offset(-30)
            taskImage.centerX.equalTo(view.snp.centerX)
            taskImage.height.equalTo(80)
            taskImage.width.equalTo(250)
        }
        tableView.snp.makeConstraints { tableView in
            tableView.centerX.equalTo(view.snp.centerX)
            tableView.centerY.equalTo(view.snp.centerY)
            tableView.left.equalTo(view.snp.left).offset(10)
            tableView.right.equalTo(view.snp.right).offset(-10)
            tableView.height.equalTo(300)
        }
        nextButton.snp.makeConstraints { nextButton in
            nextButton.top.equalTo(tableView.snp.bottom).offset(20)
            nextButton.centerX.equalTo(view.snp.centerX)
            nextButton.height.equalTo(55)
            nextButton.width.equalTo(250)
        }
        addTaskButton.snp.makeConstraints { addTaskButton in
            addTaskButton.top.equalTo(nextButton.snp.bottom).offset(20)
            addTaskButton.centerX.equalTo(view.snp.centerX)
            addTaskButton.height.equalTo(55)
            addTaskButton.width.equalTo(250)
        }
    }
    
    private func addDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func registrationCell(){
        tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: "task")
    }
    
}
extension TaskViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "task", for: indexPath) as? TaskTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
