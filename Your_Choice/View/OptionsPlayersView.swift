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
    
    
    var name = ""
    var color = ""
    var buttons = [UIButton]()
    
    var label: UILabel = {
        let label = UILabel()
        label.text = "Настройка игрока"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
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
        textfield.layer.borderWidth = 3.0
        textfield.layer.borderColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        textfield.backgroundColor = #colorLiteral(red: 0.9697982669, green: 0.9640328288, blue: 0.9742299914, alpha: 1)
        textfield.layer.cornerRadius = 15
        textfield.placeholder = "Введите ваше имя"
        textfield.font = UIFont.boldSystemFont(ofSize: 18)
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
        button.addTarget(self, action: #selector(done), for: .touchUpInside)
        return button
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
        addElements()
        addConstraints()
        checkButtonEnable()
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
        self.addSubview(label)
        self.addSubview(nameTextField)
        self.addSubview(stackView)
        self.addSubview(doneButton)
        stackView.addArrangedSubview(redImage)
        stackView.addArrangedSubview(orangeImage)
        stackView.addArrangedSubview(blueImage)
        stackView.addArrangedSubview(greenImage)
        buttons.append(redImage)
        buttons.append(orangeImage)
        buttons.append(blueImage)
        buttons.append(greenImage)
        
    }
    
    @objc private func done(){
    //выход 

    }
    
    @objc private func red(){
        for i in buttons {
            if i == redImage{
                i.layer.borderWidth = 4 // одну функцию  и логику
                i.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
                i.tintColor = .white
                i.setImage(UIImage(systemName: "checkmark"), for: .normal)
                color = "red"
                
            }else{
                i.layer.borderWidth = 0
                i.setImage(UIImage(named: ""), for: .normal)
            }
        }
        checkButtonEnable()
    }
    
    @objc private func blue(){
        for i in buttons {
            if i == blueImage{
                i.layer.borderWidth = 4 // одну функцию  и логику
                i.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
                i.tintColor = .white
                i.setImage(UIImage(systemName: "checkmark"), for: .normal)
                color = "blue"
            }else{
                i.layer.borderWidth = 0
                i.setImage(UIImage(named: ""), for: .normal)
            }
        }
        checkButtonEnable()
    }
    
    @objc private func orange(){
        for i in buttons {
            if i == orangeImage{
                i.layer.borderWidth = 4 // одну функцию  и логику
                i.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
                i.tintColor = .white
                i.setImage(UIImage(systemName: "checkmark"), for: .normal)
                color = "orange"
            }else{
                i.layer.borderWidth = 0
                i.setImage(UIImage(named: ""), for: .normal)
            }
        }
        checkButtonEnable()
    }
    
    @objc private func green(){
        for i in buttons {
            if i == greenImage{
                i.layer.borderWidth = 4 // одну функцию  и логику
                i.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
                i.tintColor = .white
                i.setImage(UIImage(systemName: "checkmark"), for: .normal)
                color = "green"
            }else{
                i.layer.borderWidth = 0
                i.setImage(UIImage(named: ""), for: .normal)
            }
        }
        checkButtonEnable()
    }
    
    private func addConstraints() {
        exitButton.snp.makeConstraints { exitButton in
            exitButton.top.equalTo(self.snp.top).offset(20)
            exitButton.right.equalTo(self.snp.right).offset(-20)
            exitButton.size.equalTo(CGSize(width: 40, height: 40))
        }
        label.snp.makeConstraints { label in
            label.top.equalTo(self.snp.top).offset(20)
            label.centerX.equalTo(self.snp.centerX)
            label.centerY.equalTo(exitButton.snp.centerY)
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
    private func checkButtonEnable(){
        if name == "" || color == "" {
            doneButton.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            doneButton.isEnabled = false
        }else{
            doneButton.backgroundColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
            doneButton.isEnabled = true
        }
    }
}

extension OptionsPlayersView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        default:
            name = textField.text ?? ""
            textField.resignFirstResponder()
            checkButtonEnable()
        }
        return false 
    }
   
}
extension OptionsPlayersView: UIGestureRecognizerDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true);
        }
}
