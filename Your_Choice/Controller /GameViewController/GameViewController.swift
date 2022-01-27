//
//  GameViewController.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 24.01.2022.
//

import Foundation
import UIKit
import RealmSwift
import SnapKit

class GameViewController: UIViewController {
    
    let realm = try! Realm()
    var gameControllerViewModels: [TaskCellViewModel] = []

   
    private var backgroundImageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "background2")
        image.contentMode = .scaleAspectFill
        image.alpha = 0.9
        return image
    }()
    
    private var firstPlayerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.tintColor = .white
        button.layer.cornerRadius = 25
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 0.6
        button.layer.shadowRadius = 4.0
        button.addTarget(self, action: #selector(tappedButtonPlayer), for: .touchUpInside)
        return button
    }()
    
    private var secondPlayerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.tintColor = .white
        button.layer.cornerRadius = 25
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 0.6
        button.layer.shadowRadius = 4.0
        button.addTarget(self, action: #selector(tappedButtonPlayer), for: .touchUpInside)
        return button
    }()
    
    private var thirdlayerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.tintColor = .white
        button.layer.cornerRadius = 25
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 0.6
        button.layer.shadowRadius = 4.0
        button.addTarget(self, action: #selector(tappedButtonPlayer), for: .touchUpInside)
        return button
    }()
    
    private var fourthPlayerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.tintColor = .white
        button.layer.cornerRadius = 25
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 0.6
        button.layer.shadowRadius = 4.0
        button.addTarget(self, action: #selector(tappedButtonPlayer), for: .touchUpInside)
        return button
    }()
    
    private var headerlabel : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Задания для каждого игрока выделены его цветом, вы можете отсортировать задания нажав на иконку игрока"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.numberOfLines = 3
        return label
    }()
    
    private var headerView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.6477616429, green: 0.2397351265, blue: 0.5922383666, alpha: 1)
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 1.5
        view.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 3, height: 3)
        view.layer.shadowOpacity = 0.6
        view.layer.shadowRadius = 4.0
        view.alpha = 0.0
        return view
    }()
    
    private var tableView: UITableView = {
        var tableView = UITableView()
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.layer.borderWidth = 1.5
//        tableView.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        tableView.layer.cornerRadius = 12
        tableView.tableFooterView = UIView()
        tableView.alpha = 0.0
        return tableView
    }()
    
    private var startButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.5998318791, green: 0.3434704244, blue: 0.6207976937, alpha: 1)
        button.tintColor = .white
        button.layer.cornerRadius = 65
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "startButton"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(tappedStartButton), for: .touchUpInside)
        return button
    }()
    
    private var loadingImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "loadingImageView1")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        addElements()
        addConstraints()
        registrationCell()
        addDelegate()
        getButtonPlayersData()
    }
    
    private func config() {
        view.backgroundColor = .white
    }
    
    private func addElements() {
        view.addSubview(backgroundImageView)
        view.addSubview(firstPlayerButton)
        view.addSubview(secondPlayerButton)
        view.addSubview(thirdlayerButton)
        view.addSubview(fourthPlayerButton)
        view.addSubview(loadingImageView)
        view.addSubview(startButton)
        view.addSubview(tableView)
        view.addSubview(headerView)
        headerView.addSubview(headerlabel)
    }
    
    private func registrationCell(){
        tableView.register(GameTableViewCell.self, forCellReuseIdentifier: GameTableViewCell.reuseID)
    }
    
    private func addDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func getButtonPlayersData(){
        let playersRealm = realm.objects(PlayerRealm.self)
        switch playersRealm.count {
        case 2:
            setSettings(color: playersRealm[0].color, title: playersRealm[0].name, button: firstPlayerButton)
            setSettings(color: playersRealm[1].color, title: playersRealm[1].name, button: secondPlayerButton)
        case 3:
            setSettings(color: playersRealm[0].color, title: playersRealm[0].name, button: firstPlayerButton)
            setSettings(color: playersRealm[1].color, title: playersRealm[1].name, button: secondPlayerButton)
            setSettings(color: playersRealm[2].color, title: playersRealm[2].name, button: thirdlayerButton)
        case 4:
            setSettings(color: playersRealm[0].color, title: playersRealm[0].name, button: firstPlayerButton)
            setSettings(color: playersRealm[1].color, title: playersRealm[1].name, button: secondPlayerButton)
            setSettings(color: playersRealm[2].color, title: playersRealm[2].name, button: thirdlayerButton)
            setSettings(color: playersRealm[3].color, title: playersRealm[3].name, button: fourthPlayerButton)
        default:
            setSettings(color: playersRealm[0].color, title: playersRealm[0].name, button: firstPlayerButton)
            setSettings(color: playersRealm[1].color, title: playersRealm[1].name, button: secondPlayerButton)
        }
    }

    private func setSettings(color: String, title: String, button: UIButton) {
        switch color {
        case "red":
            button.backgroundColor = #colorLiteral(red: 0.8465180397, green: 0.6758248806, blue: 0.7737604976, alpha: 1)
            button.setTitle(title, for: .normal)
        case "blue":
            button.backgroundColor = #colorLiteral(red: 0.281285584, green: 0.4995560646, blue: 0.7573058009, alpha: 1)
            button.setTitle(title, for: .normal)
        case "purple":
            button.backgroundColor = #colorLiteral(red: 0.692247808, green: 0.6088116169, blue: 0.931736052, alpha: 1)
            button.setTitle(title, for: .normal)
        case "green":
            button.backgroundColor = #colorLiteral(red: 0.7582806945, green: 0.8539865613, blue: 0.8737122416, alpha: 1)
            button.setTitle(title, for: .normal)
        default:
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            button.setTitle(title, for: .normal)
        }
    }
   
    
    private func addConstraints() {
        switch realm.objects(PlayerRealm.self).count {
        case 2:
            setConstraits(firstItem: firstPlayerButton, secondItem: secondPlayerButton, tableItem: firstPlayerButton, xItem: view, xOffsetLeft: 20, xOffsetRight: -20, yItem: view, yOffset: 120, height: 55, widht: 160, imageOffset: 80)
        case 3:
            setConstraits(firstItem: firstPlayerButton, secondItem: secondPlayerButton, tableItem: thirdlayerButton, xItem: view, xOffsetLeft: 20, xOffsetRight: -20, yItem: view, yOffset: 120, height: 55, widht: 160, imageOffset: 140)
            thirdlayerButton.snp.makeConstraints { thirdlayerButton in
                thirdlayerButton.height.equalTo(55)
                thirdlayerButton.width.equalTo(160)
                thirdlayerButton.centerX.equalTo(view.snp.centerX)
                thirdlayerButton.top.equalTo(secondPlayerButton.snp.bottom).offset(20)
            }
        case 4:
            setConstraits(firstItem: firstPlayerButton, secondItem: secondPlayerButton, tableItem: fourthPlayerButton, xItem: view, xOffsetLeft: 20, xOffsetRight: -20, yItem: view, yOffset: 120, height: 55, widht: 160, imageOffset: 130)
            setConstraits(firstItem: thirdlayerButton, secondItem: fourthPlayerButton, tableItem: fourthPlayerButton, xItem: view, xOffsetLeft: 20, xOffsetRight: -20, yItem: firstPlayerButton, yOffset: 75, height: 55, widht: 160, imageOffset: 140)
        default:
            setConstraits(firstItem: firstPlayerButton, secondItem: secondPlayerButton, tableItem: firstPlayerButton, xItem: view, xOffsetLeft: 20, xOffsetRight: -20, yItem: view, yOffset: 120, height: 55, widht: 160, imageOffset: 80)
        }
        backgroundImageView.snp.makeConstraints { backgroundImageView in
            backgroundImageView.bottom.equalTo(view.snp.bottom)
            backgroundImageView.top.equalTo(view.snp.top)
            backgroundImageView.left.equalTo(view.snp.left)
            backgroundImageView.right.equalTo(view.snp.right)
        }
        
    }
    
    private func setConstraits(firstItem: UIView, secondItem: UIView, tableItem: UIView?,
                                                  xItem: UIView, xOffsetLeft:Int,
                                                  xOffsetRight: Int, yItem: UIView,
                                                  yOffset: Int, height: Int, widht: Int, imageOffset: Int) {
        guard let tableItem = tableItem else { return }
        firstItem.snp.makeConstraints { firstItem in
            firstItem.height.equalTo(height)
            firstItem.width.equalTo(widht)
            firstItem.top.equalTo(yItem.snp.top).offset(yOffset)
            firstItem.left.equalTo(xItem.snp.left).offset(xOffsetLeft)
        }
        secondItem.snp.makeConstraints { secondItem in
            secondItem.height.equalTo(height)
            secondItem.width.equalTo(widht)
            secondItem.top.equalTo(yItem.snp.top).offset(yOffset)
            secondItem.right.equalTo(xItem.snp.right).offset(xOffsetRight)
        }
        tableView.snp.makeConstraints { tableView in
            tableView.bottom.equalTo(view.snp.bottom)
            tableView.left.equalTo(view.snp.left)
            tableView.right.equalTo(view.snp.right)
            tableView.top.equalTo(tableItem.snp.bottom).offset(70)
        }
        headerView.snp.makeConstraints { headerView in
            headerView.centerY.equalTo(tableView.snp.top).offset(5)
            headerView.left.equalTo(tableView.snp.left)
            headerView.right.equalTo(tableView.snp.right)
            headerView.height.equalTo(60)
        }
        headerlabel.snp.makeConstraints { headerlabel in
            headerlabel.centerY.equalTo(headerView.snp.centerY)
            headerlabel.left.equalTo(headerView.snp.left).offset(20)
            headerlabel.right.equalTo(headerView.snp.right).offset(-20)
        }
        loadingImageView.snp.makeConstraints { loadingImageView in
            loadingImageView.height.equalTo(400)
            loadingImageView.width.equalTo(400)
            loadingImageView.centerX.equalTo(view.snp.centerX)
            loadingImageView.centerY.equalTo(view.snp.centerY).offset(imageOffset)
        }
        startButton.snp.makeConstraints { startButton in
            startButton.height.equalTo(130)
            startButton.width.equalTo(130)
            startButton.centerX.equalTo(view.snp.centerX)
            startButton.centerY.equalTo(view.snp.centerY).offset(imageOffset)
        }
    }
    
    @objc private func tappedButtonPlayer() {
        
    }
    @objc private func tappedStartButton() {
        loadingImageView.rotate()
        self.startButton.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            self.hide()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            self.show()
        }
    }
}
extension GameViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameControllerViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GameTableViewCell.reuseID) as? GameTableViewCell else { return UITableViewCell()}
        let viewModel = gameControllerViewModels[indexPath.row]
        cell.setViewModel(viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
}

extension GameViewController {
    func show(_ duration: TimeInterval = 1, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.headerView.alpha = 1.0
            self.tableView.alpha = 1.0
    }, completion: completion)  }

    func hide(_ duration: TimeInterval = 2, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.loadingImageView.alpha = 0.0
            self.startButton.alpha = 0.0
    }, completion: completion)
   }
}
