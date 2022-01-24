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
    
    private var startButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "phone"), for: .normal)
        button.layer.cornerRadius = button.frame.height / 2
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(tappedButtonPlayer), for: .touchUpInside)
        return button
    }()
    
    private var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "loadingImageView")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private var backImageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.866306603, green: 0.6959679723, blue: 1, alpha: 1)
        view.alpha = 0.8
        return view
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
//        view.addSubview(backImageView)
//        view.sendSubviewToBack(backImageView)
        view.addSubview(backgroundImageView)
        view.addSubview(firstPlayerButton)
        view.addSubview(secondPlayerButton)
        view.addSubview(thirdlayerButton)
        view.addSubview(fourthPlayerButton)
        view.addSubview(imageView)
        view.sendSubviewToBack(imageView)
        view.addSubview(startButton)
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
            firstPlayerButton.snp.makeConstraints { firstPlayerButton in
                firstPlayerButton.height.equalTo(55)
                firstPlayerButton.width.equalTo(160)
                firstPlayerButton.top.equalTo(view.snp.top).offset(90)
                firstPlayerButton.left.equalTo(view.snp.left).offset(20)
            }
            secondPlayerButton.snp.makeConstraints { secondPlayerButton in
                secondPlayerButton.height.equalTo(55)
                secondPlayerButton.width.equalTo(160)
                secondPlayerButton.top.equalTo(view.snp.top).offset(90)
                secondPlayerButton.right.equalTo(view.snp.right).offset(-20)
            }
//            backImageView.snp.makeConstraints { backImageView in
//                backImageView.height.equalTo(140)
//                backImageView.top.equalTo(view.snp.top)
//                backImageView.left.equalTo(view.snp.left)
//                backImageView.right.equalTo(view.snp.right)
//
//            }
        case 3:
            firstPlayerButton.snp.makeConstraints { firstPlayerButton in
                firstPlayerButton.height.equalTo(55)
                firstPlayerButton.width.equalTo(160)
                firstPlayerButton.top.equalTo(view.snp.top).offset(90)
                firstPlayerButton.left.equalTo(view.snp.left).offset(20)
            }
            secondPlayerButton.snp.makeConstraints { secondPlayerButton in
                secondPlayerButton.height.equalTo(55)
                secondPlayerButton.width.equalTo(160)
                secondPlayerButton.top.equalTo(view.snp.top).offset(90)
                secondPlayerButton.right.equalTo(view.snp.right).offset(-20)
            }
            thirdlayerButton.snp.makeConstraints { thirdlayerButton in
                thirdlayerButton.height.equalTo(55)
                thirdlayerButton.width.equalTo(160)
                thirdlayerButton.centerX.equalTo(view.snp.centerX)
                thirdlayerButton.top.equalTo(secondPlayerButton.snp.bottom).offset(20)
            }
//            backImageView.snp.makeConstraints { backImageView in
//                backImageView.height.equalTo(220)
//                backImageView.top.equalTo(view.snp.top)
//                backImageView.left.equalTo(view.snp.left)
//                backImageView.right.equalTo(view.snp.right)
//            }
        case 4:
            firstPlayerButton.snp.makeConstraints { firstPlayerButton in
                firstPlayerButton.height.equalTo(55)
                firstPlayerButton.width.equalTo(160)
                firstPlayerButton.top.equalTo(view.snp.top).offset(90)
                firstPlayerButton.left.equalTo(view.snp.left).offset(20)
            }
            secondPlayerButton.snp.makeConstraints { secondPlayerButton in
                secondPlayerButton.height.equalTo(55)
                secondPlayerButton.width.equalTo(160)
                secondPlayerButton.top.equalTo(view.snp.top).offset(90)
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
//            backImageView.snp.makeConstraints { backImageView in
//                backImageView.height.equalTo(220)
//                backImageView.top.equalTo(view.snp.top)
//                backImageView.left.equalTo(view.snp.left)
//                backImageView.right.equalTo(view.snp.right)
//            }
        default:
                firstPlayerButton.snp.makeConstraints { firstPlayerButton in
                    firstPlayerButton.height.equalTo(55)
                    firstPlayerButton.width.equalTo(160)
                    firstPlayerButton.top.equalTo(view.snp.top).offset(90)
                    firstPlayerButton.left.equalTo(view.snp.left).offset(20)
                }
                secondPlayerButton.snp.makeConstraints { secondPlayerButton in
                    secondPlayerButton.height.equalTo(55)
                    secondPlayerButton.width.equalTo(160)
                    secondPlayerButton.top.equalTo(view.snp.top).offset(90)
                    secondPlayerButton.right.equalTo(view.snp.right).offset(-20)
                }
        }
        imageView.snp.makeConstraints { imageView in
            imageView.height.equalTo(250)
            imageView.width.equalTo(250)
            imageView.centerX.equalTo(view.snp.centerX)
            imageView.centerY.equalTo(view.snp.centerY).offset(80)
        }
        startButton.snp.makeConstraints { startButton in
            startButton.height.equalTo(150)
            startButton.width.equalTo(150)
            startButton.centerX.equalTo(view.snp.centerX)
            startButton.centerY.equalTo(view.snp.centerY).offset(80)
        }
        backgroundImageView.snp.makeConstraints { backgroundImageView in
            backgroundImageView.bottom.equalTo(view.snp.bottom)
            backgroundImageView.top.equalTo(view.snp.top)
            backgroundImageView.left.equalTo(view.snp.left)
            backgroundImageView.right.equalTo(view.snp.right)
        }
    }
    
    @objc private func tappedButtonPlayer() {
        
    }
    
}
