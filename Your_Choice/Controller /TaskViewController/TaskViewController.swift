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
    
    //MARK:- Properties
    var realm = try! Realm()
    var taskArray = [Int]()
    var segmentedType: String?
    private var viewModels: [TaskCellViewModel] = []
    private var viewModelsSortedByType: [TaskCellViewModel] = []
    
    //MARK:- UI
    private var hederView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5512769818, green: 0.2539933324, blue: 0.5770897865, alpha: 1)
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
    
    private var backgroundImageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "background2")
        image.contentMode = .scaleAspectFill
        image.alpha = 0.9
        return image
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
    
    var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Все", "Дом", "Личные", "Покупки", "Другие"])
        segmentedControl.addTarget(self, action: #selector(segmentTapped), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        segmentedControl.layer.borderWidth = 1
        segmentedControl.layer.cornerRadius = 25
        return segmentedControl
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
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.5512769818, green: 0.2539933324, blue: 0.5770897865, alpha: 1)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.tintColor = #colorLiteral(red: 0.5512769818, green: 0.2539933324, blue: 0.5770897865, alpha: 1)
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
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.5512769818, green: 0.2539933324, blue: 0.5770897865, alpha: 1)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.tintColor = #colorLiteral(red: 0.5512769818, green: 0.2539933324, blue: 0.5770897865, alpha: 1)
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
        button.backgroundColor = #colorLiteral(red: 0.5512769818, green: 0.2539933324, blue: 0.5770897865, alpha: 1)
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
    
    //MARK:- life cycle VC
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        addElements()
        addConstraints()
        addDelegate()
        registrationCell()
        getDataFromViewModels()
        checkDoneButtonValidation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getDataFromViewModels()
        segmentedControl.selectedSegmentIndex = 0
        
    }
    
    //MARK:- objc metods
    
    @objc func segmentTapped(segmentedControl: UISegmentedControl){
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            sortedSegmentedControl(taskType: nil)
            tableView.reloadData()
        case 1:
            sortedSegmentedControl(taskType: "home")
            tableView.reloadData()
        case 2:
            sortedSegmentedControl(taskType: "person")
            tableView.reloadData()
        case 3:
            sortedSegmentedControl(taskType: "shop")
            tableView.reloadData()
        case 4:
            sortedSegmentedControl(taskType: "other")
            tableView.reloadData()
        default:
            sortedSegmentedControl(taskType: nil)
            tableView.reloadData()
        }
       
    }
    
    @objc private func addTask() {
        let taskVC = TasksSettingsViewController()
        taskVC.taskVC = self
        navigationController?.present(taskVC, animated: true, completion: nil)
    }
    
    @objc func  deleteLastTask() {
        let minTasks = 0
        if realm.objects(TaskRealmBase.self).count != minTasks && viewModelsSortedByType.count != minTasks {
            removeSelectedTasks()
        }else{
            alert(title: "Внимание", message: "Создайте задание")
        }
        tableView.reloadData()
    }
    
    @objc private func goNext() {
        let viewModelsArray = sortingViewModelsByIsSelected()
        let gameVC = GameViewController()
        gameVC.gameControllerViewModels = viewModelsArray
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    //MARK:- Metods
    private func config() {
        view.backgroundColor = .white
        navigationItem.title = "Задания"
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func addElements() {
        view.addSubview(backgroundImageView)
        view.addSubview(containerView)
        containerView.addSubview(tableView)
        view.addSubview(hederView)
        view.addSubview(segmentedControl)
        view.bringSubviewToFront(segmentedControl)
        hederView.addSubview(label)
        view.addSubview(nextButton)
        view.addSubview(buttonView)
        buttonView.addSubview(minusButton)
        buttonView.addSubview(plusButton)
        
    }
    private func addConstraints() {
        backgroundImageView.snp.makeConstraints { backgroundImageView in
            backgroundImageView.bottom.equalTo(view.snp.bottom)
            backgroundImageView.top.equalTo(view.snp.top)
            backgroundImageView.left.equalTo(view.snp.left)
            backgroundImageView.right.equalTo(view.snp.right)
        }
        hederView.snp.makeConstraints { hederView in
            hederView.bottom.equalTo(segmentedControl.snp.top).offset(-20)
            hederView.centerX.equalTo(view.snp.centerX)
            hederView.height.equalTo(60)
            hederView.left.equalTo(10)
            hederView.right.equalTo(-10)
        }
        label.snp.makeConstraints { label in
            label.centerY.equalTo(hederView.snp.centerY)
            label.centerX.equalTo(hederView.snp.centerX)
        }
        segmentedControl.snp.makeConstraints { segmentedControl in
            segmentedControl.bottom.equalTo(containerView.snp.top).offset(-20)
            segmentedControl.centerX.equalTo(view.snp.centerX)
            segmentedControl.height.equalTo(40)
            segmentedControl.left.equalTo(10)
            segmentedControl.right.equalTo(-10)
        }
        containerView.snp.makeConstraints { containerView in
            containerView.centerX.equalTo(view.snp.centerX)
            containerView.centerY.equalTo(view.snp.centerY).offset(50)
            containerView.left.equalTo(view.snp.left).offset(10)
            containerView.right.equalTo(view.snp.right).offset(-10)
            containerView.height.equalTo(300)
        }
        tableView.snp.makeConstraints { tableView in
            tableView.centerX.equalTo(view.snp.centerX)
            tableView.centerY.equalTo(view.snp.centerY).offset(50)
            tableView.left.equalTo(view.snp.left).offset(10)
            tableView.right.equalTo(view.snp.right).offset(-10)
            tableView.height.equalTo(300)
        }
        nextButton.snp.makeConstraints { nextButton in
            nextButton.top.equalTo(tableView.snp.bottom).offset(50)
            nextButton.centerX.equalTo(view.snp.centerX)
            nextButton.height.equalTo(55)
            nextButton.width.equalTo(250)
        }
        buttonView.snp.makeConstraints { buttonView in
            buttonView.centerY.equalTo(tableView.snp.bottom).offset(5)
            buttonView.centerX.equalTo(tableView.snp.centerX)
            buttonView.height.equalTo(50)
            buttonView.width.equalTo(300)
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
        viewModelsSortedByType.removeAll()
        for n in 0..<realm.objects(TaskRealmBase.self).count {
            viewModelsSortedByType.append(TaskCellViewModel(taskText: realm.objects(TaskRealmBase.self)[n].taskName, taskType: realm.objects(TaskRealmBase.self)[n].category , isSelected: false, id: realm.objects(TaskRealmBase.self)[n].id ))
        }
        viewModels = viewModelsSortedByType
        for i in viewModels {
            i.isSelected = false
        }
        tableView.reloadData()
    }
    
    func addlastTask() {
        guard let lastTask = realm.objects(TaskRealmBase.self).last else { return }
        viewModels.append(TaskCellViewModel(taskText: lastTask.taskName, taskType: lastTask.category, isSelected: false, id: lastTask.id))
        tableView.reloadData()
    }
    
    private func removeSelectedTasks() {
        var id = 0
        var index = 0
        for i in viewModels {
            if i.isSelected == true {
                viewModels.remove(at: index)
                id = i.id
                let deleteObject = realm.objects(TaskRealmBase.self).first { task in
                    task.id == id
                }
                guard let object = deleteObject else { return }
                try! realm.write({
                    realm.delete(object)
                })
            }else {
                index += 1
            }
        }
        sortedSegmentedControl(taskType: segmentedType)
        tableView.reloadData()
    }
    
    private func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func changeIndexSegmentedControl(taskType: String) {
        if segmentedControl.selectedSegmentIndex != 0 {
            switch taskType {
            case "home":
                self.segmentedControl.selectedSegmentIndex = 1
            case "person":
                self.segmentedControl.selectedSegmentIndex = 2
            case "shop":
                self.segmentedControl.selectedSegmentIndex = 3
            case "other":
                self.segmentedControl.selectedSegmentIndex = 4
            default:
                self.segmentedControl.selectedSegmentIndex = 0
            }
        }
    }
    
    func sortedSegmentedControl(taskType: String?) {
        if taskType != nil {
            for i in viewModelsSortedByType {
                if i.isSelected == true{
                    for h in viewModels {
                        if h.taskText == i.taskText {
                            h.isSelected = i.isSelected
                        }
                    }
                }
            }
            let viewModelsTask = viewModels.filter() {$0.taskType == taskType}
            viewModelsSortedByType = viewModelsTask
        }else {
            for i in viewModelsSortedByType {
                if i.isSelected == true{
                    for h in viewModels {
                        if h.taskText == i.taskText {
                            h.isSelected = i.isSelected
                        }
                    }
                }
            }
            viewModelsSortedByType = viewModels
        }
        segmentedType = taskType
    }
    
    private func sortingViewModelsByIsSelected() -> [TaskCellViewModel]{
        var viewModelsArray = [TaskCellViewModel]()
        for i in viewModels {
            if i.isSelected {
                viewModelsArray.append(i)
            }
        }
        viewModelsArray.shuffle()
        return viewModelsArray
    }
    
    private func checkDoneButtonValidation(){
        let viewModelsArray = sortingViewModelsByIsSelected()
        if viewModelsArray.count >= realm.objects(PlayerRealm.self).count{
            nextButton.isEnabled = true
            nextButton.backgroundColor = #colorLiteral(red: 0.5512769818, green: 0.2539933324, blue: 0.5770897865, alpha: 1)
            nextButton.tintColor = .white
        }else{
            nextButton.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            nextButton.isEnabled = false
        }
    }
}

//MARK:- extensions TableView
extension TaskViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelsSortedByType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.reuseID ) as? TaskTableViewCell else { return UITableViewCell() }
        let viewModel = viewModelsSortedByType[indexPath.row]
        cell.setViewModel(viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = viewModelsSortedByType[indexPath.row]
        viewModel.isSelected = !viewModel.isSelected
        tableView.reloadRows(at: [indexPath], with: .automatic)
        tableView.deselectRow(at: indexPath, animated: true)
        checkDoneButtonValidation()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
