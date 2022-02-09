//
//  TaskSettingsView.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 16.01.2022.
//

import Foundation
import UIKit
import SnapKit

class TaskSettingView: UIView {
    
    var taskName = ""
    var taskType = ""
    var buttons = [UIButton]()
    
    var label: UILabel = {
        let label = UILabel()
        label.text = GlobalString.taskSettings
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
        button.layer.shadowRadius = 2.0
        return button
    }()
    
    private var taskTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        textfield.backgroundColor = #colorLiteral(red: 0.9697982669, green: 0.9640328288, blue: 0.9742299914, alpha: 1)
        textfield.layer.cornerRadius = 15
        textfield.placeholder = GlobalString.taskTextFieldPH
        textfield.font = UIFont.boldSystemFont(ofSize: 15)
        textfield.textAlignment = .center
        textfield.returnKeyType = .done
        textfield.layer.shadowColor = UIColor.black.cgColor
        textfield.layer.shadowOffset = CGSize(width: 3, height: 3)
        textfield.layer.shadowOpacity = 0.5
        textfield.layer.shadowRadius = 3.0
        textfield.autocorrectionType = .no
        return textfield
    }()
    
    private var shoppingTaskButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.setImage(UIImage(named: "shop"), for: .normal)
        button.clipsToBounds = true
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(shoppingTaskTapped), for: .touchUpInside)
        return button
    }()
    
    var shoppingLabel: UILabel = {
        let label = UILabel()
        label.text = "Покупки"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private var homeTaskButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "home"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(homeTaskTapped), for: .touchUpInside)
        return button
    }()
    
    var homeLabel: UILabel = {
        let label = UILabel()
        label.text = "Домашние"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private var personalTaskButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "person"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(personalTaskTapped), for: .touchUpInside)
        return button
    }()
    
    var personLabel: UILabel = {
        let label = UILabel()
        label.text = "Личные"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private var otherTaskButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "other"), for: .normal)
        button.tintColor = .black
        button.contentMode = .scaleAspectFit
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = .none
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(otherTaskTapped), for: .touchUpInside)
        return button
    }()
    
    var otherLabel: UILabel = {
        let label = UILabel()
        label.text = "Другое"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
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
        button.setTitle(GlobalString.doneButton, for: .normal)
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
        addDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func config(){
        self.isHidden = true
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 30
        self.layer.borderWidth = 1.5
        self.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        checkValidationTSVC()
    }
    
    private func addElements() {
        self.addSubview(label)
        self.addSubview(exitButton)
        self.addSubview(taskTextField)
        self.addSubview(doneButton)
        self.addSubview(stackView)
        stackView.addArrangedSubview(homeTaskButton)
        stackView.addArrangedSubview(personalTaskButton)
        stackView.addArrangedSubview(shoppingTaskButton)
        stackView.addArrangedSubview(otherTaskButton)
        buttons.append(homeTaskButton)
        buttons.append(personalTaskButton)
        buttons.append(shoppingTaskButton)
        buttons.append(otherTaskButton)
        self.addSubview(homeLabel)
        self.addSubview(personLabel)
        self.addSubview(shoppingLabel)
        self.addSubview(otherLabel)
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
        taskTextField.snp.makeConstraints { taskTextField in
            taskTextField.size.equalTo(CGSize(width: 300, height: 55))
            taskTextField.top.equalTo(label.snp.bottom).offset(40)
            taskTextField.centerX.equalTo(self.snp.centerX)
        }
        stackView.snp.makeConstraints { stackView in
            stackView.size.equalTo(CGSize(width: 300, height: 100))
            stackView.top.equalTo(taskTextField.snp.bottom).offset(20)
            stackView.centerX.equalTo(self.snp.centerX)
        }
        doneButton.snp.makeConstraints { doneButton in
            doneButton.size.equalTo(CGSize(width: 250, height: 55))
            doneButton.top.equalTo(stackView.snp.bottom).offset(40)
            doneButton.centerX.equalTo(self.snp.centerX)
        }
        homeTaskButton.snp.makeConstraints { homeTaskButton in
            homeTaskButton.size.equalTo(CGSize(width: 60, height: 60))
            homeTaskButton.centerY.equalTo(stackView.snp.centerY)
        }
        homeLabel.snp.makeConstraints { homeLabel in
            homeLabel.centerX.equalTo(homeTaskButton.snp.centerX)
            homeLabel.top.equalTo(homeTaskButton.snp.bottom).offset(5)
        }
        personalTaskButton.snp.makeConstraints { personalTaskButton in
            personalTaskButton.size.equalTo(CGSize(width: 60, height: 60))
            personalTaskButton.centerY.equalTo(stackView.snp.centerY)
        }
        personLabel.snp.makeConstraints { personLabel in
            personLabel.centerX.equalTo(personalTaskButton.snp.centerX)
            personLabel.top.equalTo(personalTaskButton.snp.bottom).offset(5)
        }
        shoppingTaskButton.snp.makeConstraints { shoppingTaskButton in
            shoppingTaskButton.size.equalTo(CGSize(width: 60, height: 60))
            shoppingTaskButton.centerY.equalTo(stackView.snp.centerY)
        }
        shoppingLabel.snp.makeConstraints { shoppingLabel in
            shoppingLabel.centerX.equalTo(shoppingTaskButton.snp.centerX)
            shoppingLabel.top.equalTo(shoppingTaskButton.snp.bottom).offset(5)
        }
        otherTaskButton.snp.makeConstraints { otherTaskButton in
            otherTaskButton.size.equalTo(CGSize(width: 60, height: 60))
            otherTaskButton.centerY.equalTo(stackView.snp.centerY)
        }
        otherLabel.snp.makeConstraints { otherLabel in
            otherLabel.centerX.equalTo(otherTaskButton.snp.centerX)
            otherLabel.top.equalTo(otherTaskButton.snp.bottom).offset(5)
        }
    }
    
    private func addDelegate(){
        taskTextField.delegate = self
    }
    
    private func checkValidationTSVC(){
        if taskName == "" || taskType == "" {
            doneButton.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            doneButton.isEnabled = false
        }else{
            doneButton.backgroundColor = #colorLiteral(red: 0.5512769818, green: 0.2539933324, blue: 0.5770897865, alpha: 1)
            doneButton.isEnabled = true
        }
    }
    
    @objc private func homeTaskTapped(){
        for i in buttons {
            if i == homeTaskButton{
                i.layer.borderWidth = 4
                i.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                i.tintColor = .white
                taskType = "home"
                
            }else{
                i.layer.borderWidth = 0
                i.layer.borderColor = .none
            }
        }
        checkValidationTSVC()
    }
    
    @objc private func personalTaskTapped(){
        for i in buttons {
            if i == personalTaskButton{
                i.layer.borderWidth = 4
                i.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                i.tintColor = .white
                taskType = "person"
            }else{
                i.layer.borderWidth = 0
                i.layer.borderColor = .none
            }
        }
        checkValidationTSVC()
    }
    
    @objc private func shoppingTaskTapped(){
        for i in buttons {
            if i == shoppingTaskButton{
                i.layer.borderWidth = 4
                i.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                i.tintColor = .white
                taskType = "shop"
            }else{
                i.layer.borderWidth = 0
                i.layer.borderColor = .none
            }
        }
        checkValidationTSVC()
    }
    
    @objc private func otherTaskTapped(){
        for i in buttons {
            if i == otherTaskButton{
                i.layer.borderWidth = 4
                i.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                taskType = "other"
            }else{
                i.layer.borderWidth = 0
                i.layer.borderColor = .none
            }
        }
        checkValidationTSVC()
    }
    
    @objc private func done(){
        //выход
    }
}

extension TaskSettingView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        default:
            taskName = textField.text ?? ""
            textField.resignFirstResponder()
            checkValidationTSVC()
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        default:
            taskName = textField.text ?? ""
            textField.resignFirstResponder()
            checkValidationTSVC()
        }
        return false
    }
    
}
extension TaskSettingView: UIGestureRecognizerDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true);
    }
}
