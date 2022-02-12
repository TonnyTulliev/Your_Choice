//
//  ViewController.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 01.12.2021.
//

import UIKit
import Foundation
import FirebaseAuth
import Firebase

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
    
    private var deleteEmailButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(systemName: "multiply.circle.fill"), for: .normal )
        button.backgroundColor = .clear
        button.tintColor = #colorLiteral(red: 0.5512769818, green: 0.2539933324, blue: 0.5770897865, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 10
        button.isHidden = true
        button.layer.shadowColor = .none
        button.addTarget(self, action: #selector(deleteEmail), for: .allEvents)
        return button
    }()
    
    private var deletePasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(systemName: "multiply.circle.fill"), for: .normal )
        button.backgroundColor = .clear
        button.tintColor = #colorLiteral(red: 0.5512769818, green: 0.2539933324, blue: 0.5770897865, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 10
        button.isHidden = true
        button.layer.shadowColor = .none
        button.addTarget(self, action: #selector(deletePassword), for: .allEvents)
        return button
    }()
    
    private var errorLabel : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.text = GlobalString.startErrorLabel
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 0
        label.alpha = 0
        return label
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
        textfield.autocorrectionType = .no
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
        textfield.autocorrectionType = .no
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
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
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
        button.addTarget(self, action: #selector(tappedRegistrationButton), for: .touchUpInside)
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
        
        errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        errorLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 15).isActive = true
        
        loginButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50).isActive = true
        
        emailTextField.heightAnchor.constraint(equalToConstant: 55).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -20).isActive = true
        
        deleteEmailButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        deleteEmailButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        deleteEmailButton.rightAnchor.constraint(equalTo: emailTextField.rightAnchor, constant: -20).isActive = true
        deleteEmailButton.centerYAnchor.constraint(equalTo: emailTextField.centerYAnchor).isActive = true
        
        passwordTextField.heightAnchor.constraint(equalToConstant: 55).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20).isActive = true
        
        deletePasswordButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        deletePasswordButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        deletePasswordButton.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor, constant: -20).isActive = true
        deletePasswordButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor).isActive = true
        
        mainImageView.heightAnchor.constraint(equalToConstant: 190).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 190).isActive = true
        mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -30).isActive = true
    }
    
    //MARK:- objc metods
    @objc private func tappedRegistrationButton() {
        let nextVC = RegistrationViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func deleteEmail() {
        emailTextField.text = ""
    }
    
    @objc private func deletePassword() {
        passwordTextField.text = ""
    }
    
    @objc func tappedLoginButton() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
            if error != nil {
                self?.errorLabel.alpha = 1
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self?.errorLabel.alpha = 0
                }
            }else {
                let dataBase = Firestore.firestore()
                let docRef = dataBase.collection("users").document(email)
                docRef.getDocument { (document, error) in
                    if let document = document, document.exists {
                        guard let dataDescription = document.data() else { return }
                        print("Document data: \(dataDescription)")
                        let name = dataDescription.filter { (key, value) in
                            key.lowercased().contains("name")
                        }
                        let uid = dataDescription.filter { (key, value) in
                            key.lowercased().contains("uid")
                        }
                        PlayerInfo.shared.saveUsersInfo(userNames: name, usersId: uid)
                        
                    }
                }
                let playersVC = PlayersViewController()
                self?.navigationController?.pushViewController(playersVC, animated: true)
            }
        }
    }
    
    //MARK:- metods
    private func addElementsToView(){
        view.addSubview(loginButton)
        view.addSubview(registerButtons)
        view.addSubview(emailTextField)
        view.addSubview(deleteEmailButton)
        view.addSubview(passwordTextField)
        view.addSubview(deletePasswordButton)
        view.addSubview(mainImageView)
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        view.addSubview(errorLabel)
    }
    
    private func addTFDelegate() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
}

//MARK:- Extensions
extension StartViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case emailTextField:
            if emailTextField.text == "" || emailTextField.text != ""{
                deleteEmailButton.isHidden = false
            }
        case passwordTextField:
            if passwordTextField.text == "" || passwordTextField.text != ""{
                deletePasswordButton.isHidden = false
            }
        default:
            break
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case emailTextField:
            deleteEmailButton.isHidden = true
        case passwordTextField:
            deletePasswordButton.isHidden = true
        default:
            break
        }
    }
    
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
