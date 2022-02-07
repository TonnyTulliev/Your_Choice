//
//  RegistrationViewController.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 06.12.2021.
//

import UIKit
import Firebase
import FirebaseAuth

class RegistrationViewController: BaseViewController {
    
    
    //MARK:- UI elements
    private var mainImageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "registration")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private var errorLabel : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.text = "Поля заполненны некорректно"
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
        textfield.returnKeyType = .next
        textfield.layer.shadowColor = UIColor.black.cgColor
        textfield.layer.shadowOffset = CGSize(width: 3, height: 3)
        textfield.layer.shadowOpacity = 0.4
        textfield.layer.shadowRadius = 2.0
        return textfield
    }()
    
    private var backgroundImageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "background3")
        image.contentMode = .scaleAspectFill
        image.alpha = 0.9
        return image
    }()
    
    private var nameTextField: UITextField = {
        var textfield = UITextField()
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.borderWidth = 1.0
        textfield.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        textfield.backgroundColor = #colorLiteral(red: 0.9697982669, green: 0.9640328288, blue: 0.9742299914, alpha: 1)
        textfield.layer.cornerRadius = 15
        textfield.placeholder = "Введите ваше имя"
        textfield.returnKeyType = .next
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
    
    private var repeatPasswordTextField: UITextField = {
        var textfield = UITextField()
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.isSecureTextEntry = true
        textfield.layer.borderWidth = 1.0
        textfield.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        textfield.backgroundColor = #colorLiteral(red: 0.9697982669, green: 0.9640328288, blue: 0.9742299914, alpha: 1)
        textfield.layer.cornerRadius = 15
        textfield.placeholder = "Повторите пароль"
        textfield.returnKeyType = .done
        textfield.layer.shadowColor = UIColor.black.cgColor
        textfield.layer.shadowOffset = CGSize(width: 3, height: 3)
        textfield.layer.shadowOpacity = 0.4
        textfield.layer.shadowRadius = 2.0
        return textfield
    }()
    
    private var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Зарегистрировать", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = #colorLiteral(red: 0.5512769818, green: 0.2539933324, blue: 0.5770897865, alpha: 1)
        button.tintColor = .white
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 0.6
        button.layer.shadowRadius = 4.0
        button.addTarget(self, action: #selector(registrationAction), for: .touchUpInside)
        return button
    }()
    
    private var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Назад", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = #colorLiteral(red: 0.5512769818, green: 0.2539933324, blue: 0.5770897865, alpha: 1)
        button.tintColor = .white
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 0.6
        button.layer.shadowRadius = 4.0
        button.addTarget(self, action: #selector(actionForBackButton), for: .allTouchEvents)
        return button
    }()
    
    //MARK:- Life cycle VC
    override func viewDidLoad() {
        super.viewDidLoad()
        addTFDelegate()
        addElementsToView()
        addRule()
        navigationController?.navigationBar.backgroundColor = .clear
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
        
        errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        errorLabel.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor,constant: 15).isActive = true
        
        backButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 20).isActive = true
        
        registerButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        registerButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: 50).isActive = true
        
        emailTextField.heightAnchor.constraint(equalToConstant: 55).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -10).isActive = true
        
        passwordTextField.heightAnchor.constraint(equalToConstant: 55).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30).isActive = true
        
        repeatPasswordTextField.heightAnchor.constraint(equalToConstant: 55).isActive = true
        repeatPasswordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        repeatPasswordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        repeatPasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        repeatPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10).isActive = true
        
        nameTextField.heightAnchor.constraint(equalToConstant: 55).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -10).isActive = true
        
        mainImageView.heightAnchor.constraint(equalToConstant: 170).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 170).isActive = true
        mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: nameTextField.topAnchor, constant: -20).isActive = true
    }
    
    //MARK:- objc Metods
    @objc private func actionForBackButton() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func registrationAction() {
        if checkValidation() != nil {
            errorLabel.alpha = 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.errorLabel.alpha = 0
            }
        }else {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { [weak self] (result,error) in
                if error != nil {
                    self?.errorLabel.text = "\(String(describing: error?.localizedDescription))"
                    self?.errorLabel.alpha = 1
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self?.errorLabel.alpha = 0
                    }
                }else{
                    guard let name = self?.nameTextField.text else { return }
                    guard let email = self?.emailTextField.text else { return }
                    guard let userID = result?.user.uid else { return }
                    let dataBase = Firestore.firestore()
                    dataBase.collection("users").addDocument(data: [
                        "name": name,
                        "email" : email,
                        "uid" : userID
                    ]) { (error) in
                        if error != nil {
                            self?.errorLabel.text = "Error saving user in database"
                        }
                        print(result!  .user.uid)
                    }
                    let playersVC = PlayersViewController()
                    self?.navigationController?.pushViewController(playersVC, animated: true)
                }
            }
        }
    }
    
    //MARK:- Metods
    private func addElementsToView(){
        view.addSubview(errorLabel)
        view.addSubview(nameTextField)
        view.addSubview(registerButton)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(mainImageView)
        view.addSubview(backButton)
        view.addSubview(repeatPasswordTextField)
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        
    }
    
    private func checkValidation() -> String? {
        if  nameTextField.text == ""  ||
                emailTextField.text == ""  ||
                passwordTextField.text == "" ||
                nameTextField.text == nil ||
                emailTextField.text == nil  ||
                passwordTextField.text == nil {
            return "Поля заполненны некорректно, проверьте данные"
        }
        return nil
    }
    
    private func addTFDelegate() {
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self
    }
    
    private func addRule(){
        if nameTextField.text == nil || nameTextField.text == "" ||
            emailTextField.text == nil || emailTextField.text == "" ||
            passwordTextField.text == nil || passwordTextField.text == "" ||
            repeatPasswordTextField.text == nil || repeatPasswordTextField.text == "" {
            registerButton.isEnabled = false
        }else {
            registerButton.isEnabled = true
        }
    }
}

//MARK:- Extensions
extension RegistrationViewController : UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let name = nameTextField.text
        UserDefaults.standard.setValue(name, forKey: "PlayersName")
         addRule()
    }
    
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
