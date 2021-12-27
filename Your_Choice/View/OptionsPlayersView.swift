//
//  OptionsPlayersView.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 24.12.2021.
//

import Foundation
import UIKit
import SnapKit

class OptionsPlayersView: UIView {
    
    
     var exitButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        button.setBackgroundImage(UIImage(systemName: "multiply.circle.fill"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.tintColor = .white
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 0.6
        button.layer.shadowRadius = 4.0
        return button
        }()
    
    private var nameTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.borderWidth = 2.0
        textfield.layer.borderColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        textfield.backgroundColor = #colorLiteral(red: 0.9697982669, green: 0.9640328288, blue: 0.9742299914, alpha: 1)
        textfield.layer.cornerRadius = 15
        textfield.placeholder = "Введите ваше имя"
        textfield.textAlignment = .center
        textfield.contentMode = .center
        textfield.returnKeyType = .done
        return textfield
        }()
    
    private var orangeImage: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1))
        button.addTarget(self, action: #selector(orange), for: .touchUpInside)
        return button
    }()
    
    private var redImage: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))
        button.addTarget(self, action: #selector(red), for: .touchUpInside)
        return button
    }()
    
    private var blueImage: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
        button.addTarget(self, action: #selector(blue), for: .touchUpInside)
        return button
    }()
    
    private var greenImage: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = .none
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        button.addTarget(self, action: #selector(green), for: .touchUpInside)
        
        return button
    }()
    
    private var stackView: UIStackView = {
       var stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.horizontal
        stack.distribution = UIStackView.Distribution.equalSpacing
        stack.alignment = UIStackView.Alignment.center
        stack.spacing = 10
        stack.backgroundColor = .white
        stack.translatesAutoresizingMaskIntoConstraints = false
       return stack
    }()
    
    
     var doneButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        button.setTitle("Готово", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.tintColor = .white
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 0.6
        button.layer.shadowRadius = 4.0
//        button.addTarget(self, action: #selector(done), for: .touchUpInside)
        return button
        }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
        addElements()
        addConstraints()
        nameTextField.delegate = self 
        }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        }

    private func config(){
        self.isHidden = true 
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 30
        self.layer.borderWidth = 6
        self.layer.borderColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
    }
    
    private func addElements() {
        self.addSubview(exitButton)
        self.addSubview(nameTextField)
        self.addSubview(stackView)
        self.addSubview(doneButton)
        stackView.addArrangedSubview(redImage)
        stackView.addArrangedSubview(orangeImage)
        stackView.addArrangedSubview(blueImage)
        stackView.addArrangedSubview(greenImage)
    }
    
//    @objc private func done(){
//
//    }
    @objc private func red(){
        redImage.layer.borderWidth = 4 // одну функцию  и логику 
        redImage.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        orangeImage.tintColor = .white
        redImage.setImage(UIImage(systemName: "checkmark"), for: .normal)
    }
    @objc private func blue(){
        blueImage.layer.borderWidth = 4
        blueImage.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        orangeImage.tintColor = .white
        blueImage.setImage(UIImage(systemName: "checkmark"), for: .normal)
        print("blue")
    }
    @objc private func orange(){
        orangeImage.layer.borderWidth = 4
        orangeImage.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        orangeImage.setImage(UIImage(systemName: "checkmark"), for: .normal)
        orangeImage.tintColor = .white
        print("orange")
    }
    @objc private func green(){
        greenImage.layer.borderWidth = 4
        greenImage.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        orangeImage.tintColor = .white
        greenImage.setImage(UIImage(systemName: "checkmark"), for: .normal)
        print("green")
    }
    
    private func addConstraints() {
        exitButton.snp.makeConstraints { exitButton in
            exitButton.top.equalTo(self.snp.top).offset(20)
            exitButton.right.equalTo(self.snp.right).offset(-20)
            exitButton.size.equalTo(CGSize(width: 40, height: 40))
        }
        nameTextField.snp.makeConstraints { nameTextField in
            nameTextField.size.equalTo(CGSize(width: 300, height: 60))
            nameTextField.top.equalTo(exitButton.snp.bottom).offset(20)
            nameTextField.centerX.equalTo(self.snp.centerX)
        }
        stackView.snp.makeConstraints { stackView in
            stackView.size.equalTo(CGSize(width: 300, height: 100))
            stackView.top.equalTo(nameTextField.snp.bottom).offset(20)
            stackView.centerX.equalTo(self.snp.centerX)
        }
        doneButton.snp.makeConstraints { doneButton in
            doneButton.size.equalTo(CGSize(width: 250, height: 55))
            doneButton.top.equalTo(stackView.snp.bottom).offset(20)
            doneButton.centerX.equalTo(self.snp.centerX)
        }
        redImage.snp.makeConstraints { redImage in
            redImage.size.equalTo(CGSize(width: 60, height: 60))
            redImage.centerY.equalTo(stackView.snp.centerY)
        }
        orangeImage.snp.makeConstraints { orangeImage in
            orangeImage.size.equalTo(CGSize(width: 60, height: 60))
            orangeImage.centerY.equalTo(stackView.snp.centerY)
        }
        blueImage.snp.makeConstraints { blueImage in
            blueImage.size.equalTo(CGSize(width: 60, height: 60))
            blueImage.centerY.equalTo(stackView.snp.centerY)
        }
        greenImage.snp.makeConstraints { greenImage in
            greenImage.size.equalTo(CGSize(width: 60, height: 60))
            greenImage.centerY.equalTo(stackView.snp.centerY)
        }
        
    }
}
extension OptionsPlayersView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        default:
            textField.resignFirstResponder()
        }
        return false 
    }
   
}
extension OptionsPlayersView: UIGestureRecognizerDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true);
        }
}