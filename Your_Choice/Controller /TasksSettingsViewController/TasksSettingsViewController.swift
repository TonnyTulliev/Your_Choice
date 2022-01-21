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

class TasksSettingsViewController: UIViewController {
    
    let realm = try! Realm()
    var taskVC: TaskViewController?
    var taskSettingsView = TaskSettingView()
    let task = TaskRealmBase()
    
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
        self.taskVC?.tableView.reloadData()
        dismiss(animated: true)
        
    }
    
    @objc private func exit(){
        dismiss(animated: true, completion: nil)
    }
    private func  addConstraints(){
        taskSettingsView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 60).isActive = true
        taskSettingsView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        taskSettingsView.heightAnchor.constraint(equalToConstant: 470).isActive = true
        taskSettingsView.widthAnchor.constraint(equalToConstant: 350).isActive = true
    }
}
