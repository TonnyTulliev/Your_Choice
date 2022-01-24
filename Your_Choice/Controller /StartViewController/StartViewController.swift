//
//  ViewController.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 01.12.2021.
//

import UIKit

class StartViewController: BaseViewController {
    
//MARK:- UI
    private var mainImageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "YouChoice")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private var backgroundImageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "background")
        image.contentMode = .scaleAspectFill
        image.alpha = 0.9
        return image
    }()
    
    private var emailTextField: UITextField = {
        var textfield = UITextField()
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.borderWidth = 1.0
        textfield.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        textfield.backgroundColor = #colorLiteral(red: 0.9697982669, green: 0.9640328288, blue: 0.9742299914, alpha: 1)
        textfield.layer.cornerRadius = 15
        textfield.placeholder = "Email"
        textfield.layer.shadowColor = UIColor.black.cgColor
        textfield.layer.shadowOffset = CGSize(width: 3, height: 3)
        textfield.layer.shadowOpacity = 0.4
        textfield.layer.shadowRadius = 2.0
        return textfield
    }()
    
    private var passwordTextField: UITextField = {
        var textfield = UITextField()
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.isSecureTextEntry = true
        textfield.layer.borderWidth = 1.0
        textfield.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        textfield.backgroundColor = #colorLiteral(red: 0.9697982669, green: 0.9640328288, blue: 0.9742299914, alpha: 1)
        textfield.layer.cornerRadius = 15
        textfield.placeholder = "Пароль"
        textfield.returnKeyType = .done
        textfield.layer.shadowColor = UIColor.black.cgColor
        textfield.layer.shadowOffset = CGSize(width: 3, height: 3)
        textfield.layer.shadowOpacity = 0.4
        textfield.layer.shadowRadius = 2.0
        return textfield
    }()
   
    
    private  var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.5512769818, green: 0.2539933324, blue: 0.5770897865, alpha: 1)
        button.setTitle("Логин", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.tintColor = .white
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 0.6
        button.layer.shadowRadius = 4.0
        return button
    }()
    
    var registerButtons: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Регистрация", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = #colorLiteral(red: 0.232337147, green: 0.4243679643, blue: 0.7110583186, alpha: 1)
        button.tintColor = .white
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 0.6
        button.layer.shadowRadius = 4.0
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return button
    }()
    
    
    //MARK:- Life cycle vc
    override func viewDidLoad() {
        super.viewDidLoad()
        addElementsToView()
        addTFDelegate()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        registerButtons.heightAnchor.constraint(equalToConstant: 55).isActive = true
        registerButtons.widthAnchor.constraint(equalToConstant: 250).isActive = true
        registerButtons.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButtons.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20).isActive = true
        
        loginButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40).isActive = true
        
        emailTextField.heightAnchor.constraint(equalToConstant: 55).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -20).isActive = true
        
        passwordTextField.heightAnchor.constraint(equalToConstant: 55).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20).isActive = true
        
        mainImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -40).isActive = true
        
        
    }
    
    //MARK:- objc metods
    @objc private func tappedButton() {
        let nextVC = RegistrationViewController()
//        nextVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    //MARK:- metods
    private func addElementsToView(){
        view.addSubview(loginButton)
        view.addSubview(registerButtons)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(mainImageView)
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
    }
    
    private func addTFDelegate() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
}
//MARK:- Extensions
extension StartViewController: UITextFieldDelegate {
    
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return false
    }
}
