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
   
    
    private var firstPlayerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("", for: .normal)
//        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = #colorLiteral(red: 0.7909195423, green: 0.3310045898, blue: 0.3346687257, alpha: 1)
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
//        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = #colorLiteral(red: 0.4766717553, green: 0.2852187455, blue: 0.8323209882, alpha: 1)
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
        button.setTitle("Третий", for: .normal)
//        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = #colorLiteral(red: 0.3977680504, green: 0.4119620025, blue: 0.7987191081, alpha: 1)
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
        button.setTitle("Четвертый", for: .normal)
//        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = #colorLiteral(red: 0.340542227, green: 0.6136100292, blue: 0.3587245941, alpha: 1)
        button.tintColor = .white
        button.layer.cornerRadius = 25
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 0.6
        button.layer.shadowRadius = 4.0
        button.addTarget(self, action: #selector(tappedButtonPlayer), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        addElements()
        addConstraints()
        getButtonPlayersData()
    }
    
    private func config() {
        view.backgroundColor = .white
    }
    
    private func addElements() {
        view.addSubview(firstPlayerButton)
        view.addSubview(secondPlayerButton)
        view.addSubview(thirdlayerButton)
        view.addSubview(fourthPlayerButton)
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
            button.backgroundColor = #colorLiteral(red: 0.7909195423, green: 0.3310045898, blue: 0.3346687257, alpha: 1)
            button.setTitle(title, for: .normal)
        case "blue":
            button.backgroundColor = #colorLiteral(red: 0.3977680504, green: 0.4119620025, blue: 0.7987191081, alpha: 1)
            button.setTitle(title, for: .normal)
        case "purple":
            button.backgroundColor = #colorLiteral(red: 0.4766717553, green: 0.2852187455, blue: 0.8323209882, alpha: 1)
            button.setTitle(title, for: .normal)
        case "green":
            button.backgroundColor = #colorLiteral(red: 0.340542227, green: 0.6136100292, blue: 0.3587245941, alpha: 1)
            button.setTitle(title, for: .normal)
        default:
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            button.setTitle(title, for: .normal)
        }
    }
   
    
    private func addConstraints() {
        switch realm.objects(PlayerRealm.self).count {
        case 2:
            firstPlayerButton.snp.makeConstraints { firstPlayerButton in
                firstPlayerButton.height.equalTo(55)
                firstPlayerButton.width.equalTo(160)
                firstPlayerButton.top.equalTo(view.snp.top).offset(70)
                firstPlayerButton.left.equalTo(view.snp.left).offset(20)
            }
            secondPlayerButton.snp.makeConstraints { secondPlayerButton in
                secondPlayerButton.height.equalTo(55)
                secondPlayerButton.width.equalTo(160)
                secondPlayerButton.top.equalTo(view.snp.top).offset(70)
                secondPlayerButton.right.equalTo(view.snp.right).offset(-20)
            }
        case 3:
            firstPlayerButton.snp.makeConstraints { firstPlayerButton in
                firstPlayerButton.height.equalTo(55)
                firstPlayerButton.width.equalTo(160)
                firstPlayerButton.top.equalTo(view.snp.top).offset(70)
                firstPlayerButton.left.equalTo(view.snp.left).offset(20)
            }
            secondPlayerButton.snp.makeConstraints { secondPlayerButton in
                secondPlayerButton.height.equalTo(55)
                secondPlayerButton.width.equalTo(160)
                secondPlayerButton.top.equalTo(view.snp.top).offset(70)
                secondPlayerButton.right.equalTo(view.snp.right).offset(-20)
            }
            thirdlayerButton.snp.makeConstraints { thirdlayerButton in
                thirdlayerButton.height.equalTo(55)
                thirdlayerButton.width.equalTo(160)
                thirdlayerButton.centerX.equalTo(view.snp.centerX)
                thirdlayerButton.top.equalTo(secondPlayerButton.snp.bottom).offset(20)
            }
        case 4:
            firstPlayerButton.snp.makeConstraints { firstPlayerButton in
                firstPlayerButton.height.equalTo(55)
                firstPlayerButton.width.equalTo(160)
                firstPlayerButton.top.equalTo(view.snp.top).offset(70)
                firstPlayerButton.left.equalTo(view.snp.left).offset(20)
            }
            secondPlayerButton.snp.makeConstraints { secondPlayerButton in
                secondPlayerButton.height.equalTo(55)
                secondPlayerButton.width.equalTo(160)
                secondPlayerButton.top.equalTo(view.snp.top).offset(70)
                secondPlayerButton.right.equalTo(view.snp.right).offset(-20)
            }
            thirdlayerButton.snp.makeConstraints { thirdlayerButton in
                thirdlayerButton.height.equalTo(55)
                thirdlayerButton.width.equalTo(160)
                thirdlayerButton.top.equalTo(firstPlayerButton.snp.bottom).offset(20)
                thirdlayerButton.left.equalTo(view.snp.left).offset(20)
            }
            fourthPlayerButton.snp.makeConstraints { fourthPlayerButton in
                fourthPlayerButton.height.equalTo(55)
                fourthPlayerButton.width.equalTo(160)
                fourthPlayerButton.top.equalTo(secondPlayerButton.snp.bottom).offset(20)
                fourthPlayerButton.right.equalTo(view.snp.right).offset(-20)
            }
        default:
                firstPlayerButton.snp.makeConstraints { firstPlayerButton in
                    firstPlayerButton.height.equalTo(55)
                    firstPlayerButton.width.equalTo(160)
                    firstPlayerButton.top.equalTo(view.snp.top).offset(70)
                    firstPlayerButton.left.equalTo(view.snp.left).offset(20)
                }
                secondPlayerButton.snp.makeConstraints { secondPlayerButton in
                    secondPlayerButton.height.equalTo(55)
                    secondPlayerButton.width.equalTo(160)
                    secondPlayerButton.top.equalTo(view.snp.top).offset(70)
                    secondPlayerButton.right.equalTo(view.snp.right).offset(-20)
                }
        }
    }
    
    @objc private func tappedButtonPlayer() {
        
    }
    
}
