//
//  PlayersViewController.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 08.12.2021.
//
import UIKit

class PlayersViewController: BaseViewController {
    //MARK:- Properties
    var playerName = [String?]()
    var index = 0
    var playersCounts: Int = {
            return 2
    }()
    var mainPlayerName: String {
      return UserDefaults.standard.value(forKey: "PlayersName") as! String
    }
    //MARK:- UI
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
    
    private var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus.rectangle"), for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        button.tintColor = .white
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(plusPlayer), for: .touchUpInside)
        return button
        
   }()
    private var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "minus.rectangle"), for: .normal)
        button.largeContentImage = .add
        
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.tintColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(minusPlayer), for: .touchUpInside)
        return button
        
   }()
    
    private var buttonView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .none
        return view
    }()
    
    //MARK:- life cycle VC
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

        minusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        minusButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        minusButton.leftAnchor.constraint(equalTo: buttonView.leftAnchor  ).isActive = true
        minusButton.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor).isActive = true
        
        plusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        plusButton.rightAnchor.constraint(equalTo: buttonView.rightAnchor  ).isActive = true
        plusButton.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor).isActive = true

        tableView.topAnchor.constraint(equalTo: mainTextField.bottomAnchor, constant: 40).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        buttonView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        buttonView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -10).isActive = true
        buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       
    

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
    //MARK:- objc metods
    
    @objc private func plusPlayer() {
       let maxPlayers = 5
      
        if playersCounts < maxPlayers {
            playersCounts += 1
            tableView.reloadData()
        }else {
             print(playersCounts) // добавить лейбл с оповещением
        }
      
    }
    
    @objc private func minusPlayer() {
        let minPlayers = 0
        if playersCounts > minPlayers {
            playersCounts -= 1
            tableView.reloadData()
        }else {
            print(playersCounts) // добавить лейбл с оповещением
        }
       
    }
    
    @objc private func backAction() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK:- metods
    private func addElementsToView() {
        view.addSubview(mainTextField)
        view.addSubview(nextButton)
        view.addSubview(tableView)
        view.addSubview(buttonView)
    
        buttonView.addSubview(minusButton)
        buttonView.addSubview(plusButton)
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
//MARK:- extensions textFields
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
//MARK:- extensions TableView
extension PlayersViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playersCounts
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
