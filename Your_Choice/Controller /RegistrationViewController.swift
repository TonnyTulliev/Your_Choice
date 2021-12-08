//
//  RegistrationViewController.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 06.12.2021.
//

import UIKit

class RegistrationViewController: BaseViewController {
    
    //MARK:- UI elements
    var mainImageView: UIImageView = {
       var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Registration")
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    var emailTextField: UITextField = {
        var textfield = UITextField()
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.borderWidth = 2.0
        textfield.layer.borderColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        textfield.backgroundColor = #colorLiteral(red: 0.9697982669, green: 0.9640328288, blue: 0.9742299914, alpha: 1)
        textfield.layer.cornerRadius = 15
        textfield.placeholder = "Email"
        textfield.returnKeyType = .next
        return textfield
    }()
    
    var nameTextField: UITextField = {
        var textfield = UITextField()
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.borderWidth = 2.0
        textfield.layer.borderColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        textfield.backgroundColor = #colorLiteral(red: 0.9697982669, green: 0.9640328288, blue: 0.9742299914, alpha: 1)
        textfield.layer.cornerRadius = 15
        textfield.placeholder = "Введите ваше имя"
        textfield.returnKeyType = .next
        return textfield
    }()
    
    var passwordTextField: UITextField = {
        var textfield = UITextField()
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.isSecureTextEntry = true
        textfield.layer.borderWidth = 2.0
        textfield.layer.borderColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        textfield.backgroundColor = #colorLiteral(red: 0.9697982669, green: 0.9640328288, blue: 0.9742299914, alpha: 1)
        textfield.layer.cornerRadius = 15
        textfield.placeholder = "Пароль"
        textfield.returnKeyType = .done
        return textfield
    }()
    var repeatPasswordTextField: UITextField = {
        var textfield = UITextField()
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.isSecureTextEntry = true
        textfield.layer.borderWidth = 2.0
        textfield.layer.borderColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        textfield.backgroundColor = #colorLiteral(red: 0.9697982669, green: 0.9640328288, blue: 0.9742299914, alpha: 1)
        textfield.layer.cornerRadius = 15
        textfield.placeholder = "Повторите пароль"
        textfield.returnKeyType = .done
        return textfield
    }()
    
    var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Зарегистрировать", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
        button.tintColor = .white
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(actionForRegistrationButton), for: .allTouchEvents)
        
        return button
   }()
    var backButton: UIButton = {
       let button = UIButton(type: .system)
       button.setTitle("Назад", for: .normal)
       button.titleLabel?.textAlignment = .center
       button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
       button.backgroundColor = #colorLiteral(red: 0.5555383563, green: 0, blue: 1, alpha: 1)
       button.tintColor = .white
       button.layer.cornerRadius = 25
       button.translatesAutoresizingMaskIntoConstraints = false
       button.addTarget(self, action: #selector(actionForBackButton), for: .allTouchEvents)
       
       return button
   }()
    //MARK:- Life cycle VC
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        addTFDelegate()
        addElementsToView()
        
        
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        backButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        
        registerButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        registerButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -20).isActive = true
        
        emailTextField.heightAnchor.constraint(equalToConstant: 55).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -10).isActive = true
        
        passwordTextField.heightAnchor.constraint(equalToConstant: 55).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.bottomAnchor.constraint(equalTo: repeatPasswordTextField.topAnchor, constant: -10).isActive = true
        repeatPasswordTextField.heightAnchor.constraint(equalToConstant: 55).isActive = true
        repeatPasswordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        repeatPasswordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        repeatPasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        repeatPasswordTextField.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -30).isActive = true
        
        nameTextField.heightAnchor.constraint(equalToConstant: 55).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -10).isActive = true
        
        mainImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: nameTextField.topAnchor, constant: -30).isActive = true
        
    }
    
    //MARK:- objc Metods
    
    @objc private func actionForRegistrationButton() {
        let playersVC = PlayersViewController()
        playersVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(playersVC, animated: true)
    }
    
    @objc private func actionForBackButton() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    //MARK:- Metods
    private func addElementsToView(){
        view.addSubview(nameTextField)
        view.addSubview(registerButton)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(mainImageView)
        view.addSubview(backButton)
        view.addSubview(repeatPasswordTextField)
    
    }
    private func addTFDelegate() {
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self
    }
}

//MARK:- Extensions
extension RegistrationViewController : UITextFieldDelegate{

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case nameTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            repeatPasswordTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return false
    }
   
}
