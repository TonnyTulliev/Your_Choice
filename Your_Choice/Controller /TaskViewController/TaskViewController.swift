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
    
    var realm = try! Realm()
    var taskArray = [Int]()
    private var viewModels: [TaskCellViewModel] = []
  
    private var hederView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5057837963, green: 0.3098528385, blue: 0.9293116927, alpha: 1)
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 1.5
        view.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 3, height: 3)
        view.layer.shadowOpacity = 0.6
        view.layer.shadowRadius = 4.0
        return view
    }()
    
    private var label : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Выберите задание"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    var tableView: UITableView = {
        var tableView = UITableView()
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.layer.borderWidth = 1.5
        tableView.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        tableView.layer.cornerRadius = 15
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    private var containerView: UIView = {
        let containerView:UIView = UIView()
        containerView.backgroundColor = .clear
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 3, height: 3)
        containerView.layer.shadowOpacity = 0.6
        containerView.layer.shadowRadius = 4.0
        return containerView
    }()
    
    private var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "folder.badge.plus"), for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
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
    
    private var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "folder.fill.badge.minus"), for: .normal)
        button.largeContentImage = .add
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.tintColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 0.6
        button.layer.shadowRadius = 4.0
        button.addTarget(self, action: #selector(deleteLastTask), for: .touchUpInside)
        return button
    }()
    
    private var buttonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .none
        return view
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
        getDataFromViewModels()
        tableView.reloadData()
    }
    
    @objc private func addTask() {
        let taskVC = TasksSettingsViewController()
        taskVC.taskVC = self
        navigationController?.present(taskVC, animated: true, completion: nil)
    }
    
    @objc func  deleteLastTask() {
        let minTasks = 0
        if realm.objects(TaskRealm.self).count != minTasks && viewModels.count != minTasks {
            guard let task = realm.objects(TaskRealm.self).last else { return }
            try! realm.write({
                realm.delete(task)
            })
            removeLastTask()
            tableView.reloadData()
        }else{
            alert(title: "Внимание", message: "Создайте задание")
        }
    }
    
    func getIndexForArray(index: IndexPath){
        var mainIndex = 0
        let index = index.row
        if taskArray.contains(index){
            for i in taskArray{
                if i == index{
                    taskArray.remove(at: mainIndex)
                }
                mainIndex += 1
            }
            print(taskArray)
        }else{
            taskArray.append(index)
            print(taskArray)
        }
       
    }
        
    @objc private func goNext() {
        
    }
    
    private func config() {
        view.backgroundColor = .white
        navigationItem.title = "Задания"
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func addElements() {
        view.addSubview(containerView)
        containerView.addSubview(tableView)
        view.addSubview(hederView)
        hederView.addSubview(label)
        view.addSubview(nextButton)
        view.addSubview(buttonView)
        buttonView.addSubview(minusButton)
        buttonView.addSubview(plusButton)

    }
    private func addConstraints() {
        hederView.snp.makeConstraints { hederView in
            hederView.bottom.equalTo(containerView.snp.top).offset(-20)
            hederView.centerX.equalTo(view.snp.centerX)
            hederView.height.equalTo(60)
            hederView.left.equalTo(10)
            hederView.right.equalTo(-10)
        }
        label.snp.makeConstraints { label in
            label.centerY.equalTo(hederView.snp.centerY)
            label.centerX.equalTo(hederView.snp.centerX)

        }
        containerView.snp.makeConstraints { containerView in
            containerView.centerX.equalTo(view.snp.centerX)
            containerView.centerY.equalTo(view.snp.centerY).offset(40)
            containerView.left.equalTo(view.snp.left).offset(10)
            containerView.right.equalTo(view.snp.right).offset(-10)
            containerView.height.equalTo(300)
        }
        tableView.snp.makeConstraints { tableView in
            tableView.centerX.equalTo(view.snp.centerX)
            tableView.centerY.equalTo(view.snp.centerY).offset(40)
            tableView.left.equalTo(view.snp.left).offset(10)
            tableView.right.equalTo(view.snp.right).offset(-10)
            tableView.height.equalTo(300)
        }
        nextButton.snp.makeConstraints { nextButton in
            nextButton.top.equalTo(tableView.snp.bottom).offset(40)
            nextButton.centerX.equalTo(view.snp.centerX)
            nextButton.height.equalTo(55)
            nextButton.width.equalTo(250)
        }
        buttonView.snp.makeConstraints { buttonView in
            buttonView.centerY.equalTo(tableView.snp.bottom).offset(0)
            buttonView.centerX.equalTo(tableView.snp.centerX)
            buttonView.height.equalTo(50)
            buttonView.width.equalTo(250)
        }
        minusButton.snp.makeConstraints { minusButton in
            minusButton.left.equalTo(buttonView.snp.left)
            minusButton.bottom.equalTo(buttonView.snp.bottom)
            minusButton.height.equalTo(50)
            minusButton.width.equalTo(140)
        }
        plusButton.snp.makeConstraints { plusButton in
            plusButton.right.equalTo(buttonView.snp.right)
            plusButton.bottom.equalTo(buttonView.snp.bottom)
            plusButton.height.equalTo(50)
            plusButton.width.equalTo(140)
        }
    }
    
    private func addDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func registrationCell(){
        tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskTableViewCell.reuseID)
    }
    
    private func getDataFromViewModels(){
        for n in 0..<realm.objects(TaskRealm.self).count {
            viewModels.append(TaskCellViewModel(taskText: realm.objects(TaskRealm.self)[n].taskName, taskType: realm.objects(TaskRealm.self)[n].category , isSelected: false ))
        }
    }
    
    func addlastTask() {
        guard let lastTask = realm.objects(TaskRealm.self).last else { return }
        viewModels.append(TaskCellViewModel(taskText: lastTask.taskName, taskType: lastTask.category, isSelected: false))
    }
    
    private func removeLastTask() {
        let last = viewModels.count - 1
        viewModels.remove(at: last)
    }
    
    private func removeFromDataBase(){
        // удалять выбранные объекты из базы
    }
    
    private func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}
extension TaskViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.reuseID ) as? TaskTableViewCell else { return UITableViewCell() }
        let viewModel = viewModels[indexPath.row]
        cell.setViewModel(viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        getIndexForArray(index: indexPath) // переделать через viewModels
        let viewModel = viewModels[indexPath.row]
        viewModel.isSelected = !viewModel.isSelected
        tableView.reloadRows(at: [indexPath], with: .automatic)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
