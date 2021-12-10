//
//  PlayersViewController.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 08.12.2021.
//
import UIKit

class PlayersViewController: BaseViewController {
    
    var playerName = [String?]()
    var index = 0
    var rowsCounts: Int = {
            return 2
    }()
    var mainPlayerName: String {
      return UserDefaults.standard.value(forKey: "PlayersName") as! String
    }
    private var stepper: UIStepper = {
        var step = UIStepper()
        step.translatesAutoresizingMaskIntoConstraints = false
        step.autorepeat = true
        step.maximumValue = 5
        step.minimumValue = 0
        step.stepValue = 1
        step.value = 2
        step.wraps = false
        step.addTarget(self, action: #selector(stepAction), for: .valueChanged)
        
        return step
    }()
private var tableView: UITableView = {
        var tableView = UITableView()
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.layer.borderWidth = 2
        tableView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.layer.cornerRadius = 15
        tableView.tableFooterView = UIView()
        tableView.register(PlayersTableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        return tableView
    }()
    
    private var mainTextField: UITextField = {
        var textfield = UITextField()
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.borderWidth = 2.0
        textfield.layer.borderColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        textfield.backgroundColor = #colorLiteral(red: 0.9697982669, green: 0.9640328288, blue: 0.9742299914, alpha: 1)
        textfield.layer.cornerRadius = 15
        textfield.placeholder = "Введите имя игрока"
        textfield.returnKeyType = .done
        textfield.textAlignment = .center
        return textfield
    }()
    
    private var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Выбрать задание", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        button.tintColor = .white
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return button
        
   }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addElementsToView()
        addDelegate()
        addFirstNameInArray()
        navigationController?.isNavigationBarHidden = false
        navigationItem.title = "Настройки игроков"
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        mainTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        mainTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        mainTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        mainTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        mainTextField.heightAnchor.constraint(equalToConstant: 55).isActive = true
    
        nextButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        
        tableView.topAnchor.constraint(equalTo: mainTextField.bottomAnchor, constant: 40).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 220).isActive = true
    
        stepper.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stepper.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -20).isActive = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
    

    @objc private func stepAction(_ sender: UIStepper) {
       
        let value =  Int(stepper.value)
        rowsCounts = value
        tableView.reloadData()

    }
    
    @objc private func backAction() {
        navigationController?.popViewController(animated: true)
    }
    
    private func addElementsToView() {
        view.addSubview(mainTextField)
        view.addSubview(nextButton)
        view.addSubview(tableView)
        view.addSubview(stepper)
      
    }
    
    private func addDelegate() {
        mainTextField.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func addFirstNameInArray(){
        print(mainPlayerName)
        playerName.append(mainPlayerName)
        playerName.append("Игрок")
        playerName.append("Игрок")
        playerName.append("Игрок")
        playerName.append("Игрок")
    }
    
   
}
extension PlayersViewController: UITextFieldDelegate {
    
  func textFieldDidEndEditing(_ textField: UITextField) {
    
    
  }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        for  name in playerName{
            
            if name == "Игрок"{
                index += 1
                print(index)
                playerName.insert(mainTextField.text, at: index)
               break
            }
        }
        print(playerName[selectAll(_:)])
        tableView.reloadData()
        mainTextField.resignFirstResponder()
        mainTextField.text = ""
        return true
    }
    
}
extension PlayersViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsCounts
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.textAlignment = .center
        cell.separatorInset.bottom = .zero
        cell.textLabel?.text = playerName[indexPath.row]
  
        return cell
  
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        mainTextField.becomeFirstResponder()
     
    }
}
