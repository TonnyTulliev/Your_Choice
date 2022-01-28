//
//  TasksSettingsViewController.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 16.01.2022.
//

import Foundation
import  UIKit
import SnapKit
import RealmSwift

class TasksSettingsViewController: BaseViewController {
    
    //MARK:- Properties
    let realm = try! Realm()
    var taskVC: TaskViewController?
    var taskSettingsView = TaskSettingView()
    let task = TaskRealmBase()
    
    //MARK:- UI
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.toolbar.isHidden = true
        view.backgroundColor = .clear
        taskSettingsView.doneButton.addTarget(self, action: #selector(done), for: .touchUpInside)
        taskSettingsView.exitButton.addTarget(self, action: #selector(exit), for: .touchUpInside)
        taskSettingsView.isHidden = false
        addElements()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addConstraints()
    }
    
    //MARK:- metods
    private func  addElements(){
        view.addSubview(taskSettingsView)
    }
    
    private func fetchValueFromRealm() -> Int? {
        if realm.objects(TaskRealmBase.self).count == 0 {
            let lastId = task.id
            let newId = lastId + 1
            return newId
        }else {
            guard let lastId = realm.objects(TaskRealmBase.self).last?.id else { return nil }
            let newID = lastId + 1
            return newID
        }
    }
    
    private func  addConstraints(){
        taskSettingsView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 60).isActive = true
        taskSettingsView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        taskSettingsView.heightAnchor.constraint(equalToConstant: 470).isActive = true
        taskSettingsView.widthAnchor.constraint(equalToConstant: 350).isActive = true
    }
    
    private func addTaskToTableViewBySC(taskType: String?){
        switch self.taskVC?.segmentedControl.selectedSegmentIndex {
        case 0:
            self.taskVC?.sortedSegmentedControl(taskType: nil)
            self.taskVC?.tableView.reloadData()
        case 1:
            self.taskVC?.sortedSegmentedControl(taskType: taskType)
            self.taskVC?.tableView.reloadData()
        case 2:
            self.taskVC?.sortedSegmentedControl(taskType: taskType)
            self.taskVC?.tableView.reloadData()
        case 3:
            self.taskVC?.sortedSegmentedControl(taskType: taskType)
            self.taskVC?.tableView.reloadData()
        case 4:
            self.taskVC?.sortedSegmentedControl(taskType: taskType)
            self.taskVC?.tableView.reloadData()
        default:
            self.taskVC?.sortedSegmentedControl(taskType: taskType)
            self.taskVC?.tableView.reloadData()
        }
    }
    
    //MARK:- objc metods
    @objc private func done(){
        guard let newId = fetchValueFromRealm() else { return }
        let taskName = taskSettingsView.taskName
        let category = taskSettingsView.taskType
        task.category = category
        task.taskName = taskName
        task.id = newId
        try! self.realm.write({
            self.realm.add(task)
        })
        self.taskVC?.addlastTask()
        addTaskToTableViewBySC(taskType: category)
        self.taskVC?.changeIndexSegmentedControl(taskType: category)
        dismiss(animated: true)
        
    }
    
    @objc private func exit(){
        dismiss(animated: true, completion: nil)
    }
}
