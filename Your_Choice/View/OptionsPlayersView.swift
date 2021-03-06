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
        label.text = GlobalString.playerSettings
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    var exitButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.5512769818, green: 0.2539933324, blue: 0.5770897865, alpha: 1)
        button.setBackgroundImage(UIImage(systemName: "multiply.circle.fill"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.tintColor = .white
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 3.0
        return button
    }()
    
    var nameTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        textfield.backgroundColor = #colorLiteral(red: 0.9697982669, green: 0.9640328288, blue: 0.9742299914, alpha: 1)
        textfield.layer.cornerRadius = 15
        textfield.placeholder = GlobalString.playersNamePH
        textfield.font = UIFont.boldSystemFont(ofSize: 15)
        textfield.textAlignment = .center
        textfield.contentMode = .center
        textfield.returnKeyType = .done
        textfield.layer.shadowColor = UIColor.black.cgColor
        textfield.layer.shadowOffset = CGSize(width: 3, height: 3)
        textfield.layer.shadowOpacity = 0.5
        textfield.layer.shadowRadius = 3.0
        textfield.autocorrectionType = .no
        return textfield
    }()
    
    var purpleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.692247808, green: 0.6088116169, blue: 0.931736052, alpha: 1))
        button.addTarget(self, action: #selector(purpleTapped), for: .touchUpInside)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 3.0
        return button
    }()
    
    var redButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.8465180397, green: 0.6758248806, blue: 0.7737604976, alpha: 1))
        button.addTarget(self, action: #selector(redTapped), for: .touchUpInside)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 3.0
        return button
    }()
    
    var blueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.281285584, green: 0.4995560646, blue: 0.7573058009, alpha: 1))
        button.addTarget(self, action: #selector(blueTapped), for: .touchUpInside)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 3.0
        return button
    }()
    
    var greenButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = .none
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.7582806945, green: 0.8539865613, blue: 0.8737122416, alpha: 1))
        button.addTarget(self, action: #selector(greenTapped), for: .touchUpInside)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 3.0
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
        button.backgroundColor = #colorLiteral(red: 0.5512769818, green: 0.2539933324, blue: 0.5770897865, alpha: 1)
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
        checkValidationPOVC()
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
        self.layer.borderWidth = 1.5
        self.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
    private func addElements() {
        self.addSubview(exitButton)
        self.addSubview(label)
        self.addSubview(nameTextField)
        self.addSubview(stackView)
        self.addSubview(doneButton)
        stackView.addArrangedSubview(redButton)
        stackView.addArrangedSubview(purpleButton)
        stackView.addArrangedSubview(blueButton)
        stackView.addArrangedSubview(greenButton)
        buttons.append(redButton)
        buttons.append(purpleButton)
        buttons.append(blueButton)
        buttons.append(greenButton)
        
    }
    
    @objc private func done(){
        //выход
        
    }
    
    @objc private func redTapped(){
        checkValidationPOVC()
        for i in buttons {
            if i == redButton{
                i.layer.borderWidth = 4 // одну функцию  и логику
                i.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                i.tintColor = .white
                i.setImage(UIImage(systemName: "checkmark"), for: .normal)
                color = GlobalString.redColor
                
            }else{
                i.layer.borderWidth = 0
                i.setImage(UIImage(named: ""), for: .normal)
            }
        }
        checkValidationPOVC()
    }
    
    @objc private func blueTapped(){
        checkValidationPOVC()
        for i in buttons {
            if i == blueButton{
                i.layer.borderWidth = 4 // одну функцию  и логику
                i.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                i.tintColor = .white
                i.setImage(UIImage(systemName: "checkmark"), for: .normal)
                color = GlobalString.blueColor
            }else{
                i.layer.borderWidth = 0
                i.setImage(UIImage(named: ""), for: .normal)
            }
        }
        checkValidationPOVC()
    }
    
    @objc private func purpleTapped(){
        checkValidationPOVC()
        for i in buttons {
            if i == purpleButton{
                i.layer.borderWidth = 4 // одну функцию  и логику
                i.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                i.tintColor = .white
                i.setImage(UIImage(systemName: "checkmark"), for: .normal)
                color = GlobalString.purpleColor
            }else{
                i.layer.borderWidth = 0
                i.setImage(UIImage(named: ""), for: .normal)
            }
        }
        checkValidationPOVC()
    }
    
    @objc private func greenTapped(){
        checkValidationPOVC()
        for i in buttons {
            if i == greenButton{
                i.layer.borderWidth = 4
                i.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                i.tintColor = .white
                i.setImage(UIImage(systemName: "checkmark"), for: .normal)
                color = GlobalString.greenColor
            }else{
                i.layer.borderWidth = 0
                i.setImage(UIImage(named: ""), for: .normal)
            }
        }
        checkValidationPOVC()
    }
    
    private func addConstraints() {
        exitButton.snp.makeConstraints { exitButton in
            exitButton.top.equalTo(self.snp.top).offset(20)
            exitButton.right.equalTo(self.snp.right).offset(-20)
            exitButton.size.equalTo(CGSize(width: 40, height: 40))
        }
        label.snp.makeConstraints { label in
            label.top.equalTo(self.snp.top).offset(60)
            label.centerX.equalTo(self.snp.centerX)
        }
        nameTextField.snp.makeConstraints { nameTextField in
            nameTextField.size.equalTo(CGSize(width: 300, height: 55))
            nameTextField.top.equalTo(label.snp.bottom).offset(40)
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
        redButton.snp.makeConstraints { redImage in
            redImage.size.equalTo(CGSize(width: 60, height: 60))
            redImage.centerY.equalTo(stackView.snp.centerY)
        }
        purpleButton.snp.makeConstraints { orangeImage in
            orangeImage.size.equalTo(CGSize(width: 60, height: 60))
            orangeImage.centerY.equalTo(stackView.snp.centerY)
        }
        blueButton.snp.makeConstraints { blueImage in
            blueImage.size.equalTo(CGSize(width: 60, height: 60))
            blueImage.centerY.equalTo(stackView.snp.centerY)
        }
        greenButton.snp.makeConstraints { greenImage in
            greenImage.size.equalTo(CGSize(width: 60, height: 60))
            greenImage.centerY.equalTo(stackView.snp.centerY)
        }
        
    }
    private func checkValidationPOVC(){
        if name == "" || color == "" {
            doneButton.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            doneButton.isEnabled = false
        }else{
            doneButton.backgroundColor = #colorLiteral(red: 0.5512769818, green: 0.2539933324, blue: 0.5770897865, alpha: 1)
            doneButton.isEnabled = true
        }
    }
}

extension OptionsPlayersView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        default:
            name = textField.text ?? ""
            textField.resignFirstResponder()
            checkValidationPOVC()
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        default:
            name = textField.text ?? ""
            textField.resignFirstResponder()
            checkValidationPOVC()
        }
        return false
    }
}

extension OptionsPlayersView: UIGestureRecognizerDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true);
    }
}
