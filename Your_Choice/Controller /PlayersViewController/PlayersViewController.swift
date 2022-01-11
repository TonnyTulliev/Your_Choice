//
//  PlayersViewController.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 08.12.2021.
//
import UIKit
import SnapKit
import RealmSwift

class PlayersViewController: BaseViewController {
    
    //MARK:- Properties
    var index = 0
    let realm = try! Realm()
    var mainPlayerName: String {
        return UserDefaults.standard.value(forKey: "PlayersName") as! String
    }
    
    //MARK:- UI
    
    private var playersImageView: UIImageView = {
        var image = UIImageView()
         image.translatesAutoresizingMaskIntoConstraints = false
         image.image = UIImage(named: "Players")
         image.contentMode = .scaleAspectFill
         return image
     }()
    
    private var label : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Введите имя и выберите цвет игроков"
        label.font =  UIFont(name: "Arial Rounded MT Bold", size: 18)
        label.numberOfLines = 0
        return label
    }()
    
    var tableView: UITableView = {
        var tableView = UITableView()
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.layer.borderWidth = 4
        tableView.layer.borderColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        tableView.layer.cornerRadius = 15
        tableView.tableFooterView = UIView()
        return tableView
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
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 0.6
        button.layer.shadowRadius = 4.0
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return button
    }()
    
    private var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "person.crop.circle.badge.plus"), for: .normal)
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
        button.addTarget(self, action: #selector(plusPlayer), for: .touchUpInside)
        return button
    }()
    
    private var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "delete.left"), for: .normal)
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
        button.addTarget(self, action: #selector(minusPlayer), for: .touchUpInside)
        return button
    }()
    
    private var buttonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .none
        return view
    }()
    
    private var mainView : UIView = {
        let view = UIView(frame: CGRect(x: 100, y: 100, width: 100, height:250))
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 2
        view.layer.borderColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var hederView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        view.layer.cornerRadius = 25
        view.layer.borderWidth = 2
        view.layer.borderColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK:- life cycle VC
    override func viewDidLoad() {
        super.viewDidLoad()
        addElementsToView()
        addDelegate()
        registreationCell()
        сonfig()
        removePlayersDataBase()
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        playersImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        playersImageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        playersImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        playersImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
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
        
        hederView.topAnchor.constraint(equalTo: playersImageView.bottomAnchor, constant: 45).isActive = true
        hederView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        hederView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        hederView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        tableView.topAnchor.constraint(equalTo: hederView.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 254).isActive = true
       
        buttonView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        buttonView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -10).isActive = true
        buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        label.widthAnchor.constraint(equalToConstant: 250).isActive = true
        label.centerXAnchor.constraint(equalTo: hederView.centerXAnchor).isActive = true
    }
    
    //MARK:- objc metods
    @objc private func plusPlayer() {
               let maxPlayers = 4
                if realm.objects(PlayerRealm.self).count < maxPlayers {
                    let optionsVC = OptionsViewControoler()
                    optionsVC.playersVC = self 
                    navigationController?.present(optionsVC, animated: true)
                    tableView.reloadData()
                }else {
                    //alert
                }
    }
    
    @objc private func minusPlayer() {
        let minPlayers = 0
        guard let lastPlayer = realm.objects(PlayerRealm.self).last else { return } 
        if realm.objects(PlayerRealm.self).count > minPlayers {
            try! realm.write({
                realm.delete(lastPlayer)
            })
            tableView.reloadData()
        }else {
           //alert
        }
    }
    
    @objc private func backAction() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK:- metods
    private func addElementsToView() {
        view.addSubview(nextButton)
        view.addSubview(tableView)
        view.addSubview(buttonView)
        view.addSubview(hederView)
        view.addSubview(playersImageView)
        buttonView.addSubview(minusButton)
        buttonView.addSubview(plusButton)
        hederView.addSubview(label)
    
    }
    
    private func addDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
       
    }
    private func registreationCell() {
        tableView.register(PlayersTableViewCell.self, forCellReuseIdentifier: "text")
        tableView.register(PlayerHeaderTableView.self, forHeaderFooterViewReuseIdentifier: "head")
    }
    
    private func сonfig(){
        view.alpha = 1
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Настройки игроков"
    }
    
    private func removePlayersDataBase(){
        try! realm.write({
            realm.deleteAll()
        })
    }
}

//MARK:- extensions TableView
extension PlayersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realm.objects(PlayerRealm.self).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "text", for: indexPath) as? PlayersTableViewCell else { return UITableViewCell()}
        cell.fetchData(player: realm.objects(PlayerRealm.self)[indexPath.row])
        cell.player = realm.objects(PlayerRealm.self)[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

extension PlayersViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    func textFieldShouldReturn(_ textField: UITextField, indexPath: IndexPath, tableView: UITableView) -> Bool {
        return false
    }
}

