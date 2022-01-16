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
    var category = "" 
    
    var label: UILabel = {
        let label = UILabel()
        label.text = "Настройка задания"
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
    
    private var taskTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.borderWidth = 3.0
        textfield.layer.borderColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        textfield.backgroundColor = #colorLiteral(red: 0.9697982669, green: 0.9640328288, blue: 0.9742299914, alpha: 1)
        textfield.layer.cornerRadius = 15
        textfield.placeholder = "Напишите задание"
        textfield.font = UIFont.boldSystemFont(ofSize: 18)
        textfield.textAlignment = .center
        textfield.contentMode = .center
        textfield.returnKeyType = .done
        return textfield
        }()
    
    var doneButton: UIButton = {
       let button = UIButton()
       button.backgroundColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
       button.setTitle("Создать", for: .normal)
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
        self.layer.borderWidth = 6
        self.layer.borderColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
    }
    
    private func addElements() {
        self.addSubview(label)
        self.addSubview(exitButton)
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
        taskTextField.snp.makeConstraints { taskTextField in
            taskTextField.size.equalTo(CGSize(width: 300, height: 60))
            taskTextField.top.equalTo(exitButton.snp.bottom).offset(20)
            taskTextField.centerX.equalTo(self.snp.centerX)
        }
        doneButton.snp.makeConstraints { doneButton in
            doneButton.size.equalTo(CGSize(width: 250, height: 55))
            doneButton.top.equalTo(taskTextField.snp.bottom).offset(50)
            doneButton.centerX.equalTo(self.snp.centerX)
        }
    }
    
    private func addDelegate(){
        taskTextField.delegate = self
    }
    
    @objc private func done(){
    //выход

    }
}

extension TaskSettingView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        default:
            taskName = textField.text ?? ""
            textField.resignFirstResponder()
        }
        return false
    }
   
}
extension TaskSettingView: UIGestureRecognizerDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true);
        }
}
