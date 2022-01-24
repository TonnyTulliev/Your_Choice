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
        button.setBackgroundImage(UIImage(named: "rocket"), for: .normal)
        button.layer.cornerRadius = button.frame.height / 2
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(tappedButtonPlayer), for: .touchUpInside)
        return button
    }()
    
    private var imageView: UIImageView = {
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
        view.addSubview(imageView)
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
            setConstraits(firstItem: firstPlayerButton, secondItem: secondPlayerButton, xItem: view, xOffsetLeft: 20, xOffsetRight: -20, yItem: view, yOffset: 120, height: 55, widht: 160)
           
        case 3:
            setConstraits(firstItem: firstPlayerButton, secondItem: secondPlayerButton, xItem: view, xOffsetLeft: 20, xOffsetRight: -20, yItem: view, yOffset: 120, height: 55, widht: 160)
            thirdlayerButton.snp.makeConstraints { thirdlayerButton in
                thirdlayerButton.height.equalTo(55)
                thirdlayerButton.width.equalTo(160)
                thirdlayerButton.centerX.equalTo(view.snp.centerX)
                thirdlayerButton.top.equalTo(secondPlayerButton.snp.bottom).offset(20)
            }
        case 4:
            setConstraits(firstItem: firstPlayerButton, secondItem: secondPlayerButton, xItem: view, xOffsetLeft: 20, xOffsetRight: -20, yItem: view, yOffset: 120, height: 55, widht: 160)
            setConstraits(firstItem: thirdlayerButton, secondItem: fourthPlayerButton, xItem: view, xOffsetLeft: 20, xOffsetRight: -20, yItem: firstPlayerButton, yOffset: 75, height: 55, widht: 160)
        default:
            setConstraits(firstItem: firstPlayerButton, secondItem: secondPlayerButton, xItem: view, xOffsetLeft: 20, xOffsetRight: -20, yItem: view, yOffset: 120, height: 55, widht: 160)
        }
        imageView.snp.makeConstraints { imageView in
            imageView.height.equalTo(450)
            imageView.width.equalTo(450)
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
    
    private func setConstraits(firstItem: UIView, secondItem: UIView, xItem: UIView, xOffsetLeft:Int,
                               xOffsetRight: Int, yItem: UIView, yOffset: Int, height: Int, widht: Int ) {
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
    }
    
    @objc private func tappedButtonPlayer() {
        
    }
    
}
