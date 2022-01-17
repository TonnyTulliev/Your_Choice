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
        label.text = "Выберите от 2 до 4 игроков"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
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
    
    var tableView: UITableView = {
        var tableView = UITableView()
        let imageView = UIImageView(image: UIImage(named: "people"))
        imageView.contentMode = .scaleAspectFit
        tableView.backgroundView = imageView
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.layer.borderWidth = 1.5
        tableView.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        tableView.layer.cornerRadius = 15
        tableView.tableFooterView = UIView()
        tableView.layer.shadowColor = UIColor.black.cgColor
        tableView.layer.shadowOffset = CGSize(width: 3, height: 3)
        tableView.layer.shadowOpacity = 0.6
        tableView.layer.shadowRadius = 4.0
        return tableView
    }()
    
    var containerView: UIView = {
        let containerView:UIView = UIView()
        containerView.backgroundColor = .clear
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 3, height: 3)
        containerView.layer.shadowOpacity = 0.6
        containerView.layer.shadowRadius = 4.0
        return containerView
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
        button.addTarget(self, action: #selector(taskScreenAction), for: .touchUpInside)
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
        button.setImage(UIImage(systemName: "person.crop.circle.fill.badge.minus"), for: .normal)
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
        button.layer.shadowOpacity = 0.1
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
    
    //MARK:- life cycle VC
    override func viewDidLoad() {
        super.viewDidLoad()
        addElementsToView()
        addDelegate()
        registrationCell()
        сonfig()
        removePlayersDataBase()
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        playersImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        playersImageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        playersImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        playersImageView.bottomAnchor.constraint(equalTo: hederView.topAnchor, constant: -30).isActive = true
        
        nextButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 45).isActive = true
        
        minusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        minusButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        minusButton.leftAnchor.constraint(equalTo: buttonView.leftAnchor  ).isActive = true
        minusButton.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor).isActive = true
        
        plusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        plusButton.rightAnchor.constraint(equalTo: buttonView.rightAnchor  ).isActive = true
        plusButton.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor).isActive = true
        
        hederView.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -20).isActive = true
        hederView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        hederView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        hederView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 60).isActive = true
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 243).isActive = true
        
        tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 60).isActive = true
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 10).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -10).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 243).isActive = true
       
        buttonView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        buttonView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -20).isActive = true
        buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        label.widthAnchor.constraint(equalToConstant: 250).isActive = true
        label.centerXAnchor.constraint(equalTo: hederView.centerXAnchor).isActive = true
        
        
        
//        infoImage.centerYAnchor.constraint(equalTo: tableView.centerYAnchor,constant: -12).isActive = true
//        infoImage.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
//        infoImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
//        infoImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
//        infoLabel.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
//        infoLabel.topAnchor.constraint(equalTo: infoImage.bottomAnchor,constant: -12).isActive = true
    }
    
    //MARK:- objc metods
    @objc private func plusPlayer() {
        let maxPlayers = 4
        if realm.objects(PlayerRealm.self).count < maxPlayers {
            let optionsVC = OptionsViewControoler()
            optionsVC.playersVC = self
            navigationController?.present(optionsVC, animated: true)
        }else {
            alert(title: "Внимание", message: "Достигнуто максимальное количество игроков")
        }
    }
    
    @objc private func minusPlayer() {
        let minPlayers = 0
        if realm.objects(PlayerRealm.self).count != minPlayers {
            guard let lastPlayer = realm.objects(PlayerRealm.self).last else { return }
            try! realm.write({
                realm.delete(lastPlayer)
            })
            tableView.reloadData()
            print(realm.objects(PlayerRealm.self).count)
        }else {
            alert(title: "Внимание", message: "Необходимо минимум 2 игрока")
            print(realm.objects(PlayerRealm.self).count)
        }
    }
    
    @objc private func taskScreenAction() {
//        changeStateTheTaskButton()
        let taskVC = TaskViewController()
        navigationController?.pushViewController(taskVC, animated: true)
    }
    
    //MARK:- metods
    private func addElementsToView() {
        view.addSubview(nextButton)
        view.addSubview(containerView)
        containerView.addSubview(tableView)
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
    
    private func registrationCell() {
        tableView.register(PlayersTableViewCell.self, forCellReuseIdentifier: "text")
        tableView.register(PlayerHeaderTableView.self, forHeaderFooterViewReuseIdentifier: "head")
    }
    
    private func сonfig(){
        view.alpha = 1
        navigationController?.isNavigationBarHidden = false
        navigationItem.title = "Игроки"
       
    }
    
    private func removePlayersDataBase() {
        try! realm.write({
            let base = realm.objects(PlayerRealm.self)
            realm.delete(base)
        })
    }
    
    private func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func changeStateTheTaskButton() {
        if realm.objects(PlayerRealm.self).count < 2  {
            alert(title: "Внимание", message: "Необходимо минимум 2 игрока")
        }
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

