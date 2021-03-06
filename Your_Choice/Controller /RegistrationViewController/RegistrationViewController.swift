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
        label.text = GlobalString.registrationErrorLabel
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 0
        label.alpha = 0
        return label
    }()
    
    private var backgroundImageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "background3")
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
        textfield.placeholder = GlobalString.emailTextFieldPH
        textfield.returnKeyType = .next
        textfield.layer.shadowColor = UIColor.black.cgColor
        textfield.layer.shadowOffset = CGSize(width: 3, height: 3)
        textfield.layer.shadowOpacity = 0.4
        textfield.layer.shadowRadius = 2.0
        textfield.autocorrectionType = .no
        return textfield
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
    
    
    
    private var nameTextField: UITextField = {
        var textfield = UITextField()
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.borderWidth = 1.0
        textfield.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        textfield.backgroundColor = #colorLiteral(red: 0.9697982669, green: 0.9640328288, blue: 0.9742299914, alpha: 1)
        textfield.layer.cornerRadius = 15
        textfield.placeholder = GlobalString.nameTextFieldPH
        textfield.returnKeyType = .next
        textfield.layer.shadowColor = UIColor.black.cgColor
        textfield.layer.shadowOffset = CGSize(width: 3, height: 3)
        textfield.layer.shadowOpacity = 0.4
        textfield.layer.shadowRadius = 2.0
        textfield.autocorrectionType = .no
        return textfield
    }()
    
    private var deleteNameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(systemName: "multiply.circle.fill"), for: .normal )
        button.backgroundColor = .clear
        button.tintColor = #colorLiteral(red: 0.5512769818, green: 0.2539933324, blue: 0.5770897865, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 10
        button.isHidden = true
        button.layer.shadowColor = .none
        button.addTarget(self, action: #selector(deleteName), for: .allEvents)
        return button
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
        textfield.placeholder = GlobalString.passwordTextFieldPH
        textfield.returnKeyType = .done
        textfield.layer.shadowColor = UIColor.black.cgColor
        textfield.layer.shadowOffset = CGSize(width: 3, height: 3)
        textfield.layer.shadowOpacity = 0.4
        textfield.layer.shadowRadius = 2.0
        textfield.autocorrectionType = .no
        return textfield
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
        textfield.placeholder = GlobalString.repeatPasswordTextFieldPH
        textfield.returnKeyType = .done
        textfield.layer.shadowColor = UIColor.black.cgColor
        textfield.layer.shadowOffset = CGSize(width: 3, height: 3)
        textfield.layer.shadowOpacity = 0.4
        textfield.layer.shadowRadius = 2.0
        textfield.autocorrectionType = .no
        return textfield
    }()
    
    private var deleteRepPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(systemName: "multiply.circle.fill"), for: .normal )
        button.backgroundColor = .clear
        button.tintColor = #colorLiteral(red: 0.5512769818, green: 0.2539933324, blue: 0.5770897865, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 10
        button.isHidden = true
        button.layer.shadowColor = .none
        button.addTarget(self, action: #selector(deleteRepPassword), for: .allEvents)
        return button
    }()
    
    private var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(GlobalString.registerButton, for: .normal)
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
        button.setTitle(GlobalString.backButton, for: .normal)
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
        
        deleteEmailButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        deleteEmailButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        deleteEmailButton.rightAnchor.constraint(equalTo: emailTextField.rightAnchor, constant: -20).isActive = true
        deleteEmailButton.centerYAnchor.constraint(equalTo: emailTextField.centerYAnchor).isActive = true
        
        passwordTextField.heightAnchor.constraint(equalToConstant: 55).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30).isActive = true
        
        deletePasswordButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        deletePasswordButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        deletePasswordButton.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor, constant: -20).isActive = true
        deletePasswordButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor).isActive = true
        
        repeatPasswordTextField.heightAnchor.constraint(equalToConstant: 55).isActive = true
        repeatPasswordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        repeatPasswordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        repeatPasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        repeatPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10).isActive = true
        
        deleteRepPasswordButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        deleteRepPasswordButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        deleteRepPasswordButton.rightAnchor.constraint(equalTo: repeatPasswordTextField.rightAnchor, constant: -20).isActive = true
        deleteRepPasswordButton.centerYAnchor.constraint(equalTo: repeatPasswordTextField.centerYAnchor).isActive = true
        
        nameTextField.heightAnchor.constraint(equalToConstant: 55).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -10).isActive = true
        
        deleteNameButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        deleteNameButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        deleteNameButton.rightAnchor.constraint(equalTo: nameTextField.rightAnchor, constant: -20).isActive = true
        deleteNameButton.centerYAnchor.constraint(equalTo: nameTextField.centerYAnchor).isActive = true
        
        mainImageView.heightAnchor.constraint(equalToConstant: 170).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 170).isActive = true
        mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: nameTextField.topAnchor, constant: -20).isActive = true
    }
    
    //MARK:- objc Metods
    @objc private func actionForBackButton() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc private func deleteEmail(){
        emailTextField.text = ""
    }
    
    @objc private func deleteName(){
        nameTextField.text = ""
    }
    
    @objc private func deletePassword(){
        passwordTextField.text = ""
    }
    
    @objc private func deleteRepPassword(){
        repeatPasswordTextField.text = ""
    }
    
    @objc func registrationAction() {
        if checkValidation() != nil ||
           checkPasswordValidation() {
            errorLabel.alpha = 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.errorLabel.alpha = 0
            }
        }else {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { [weak self] (result,error) in
                if error != nil {
                    guard let error = error?.localizedDescription else { return }
                    self?.errorLabel.text = error
                    self?.errorLabel.alpha = 1
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self?.errorLabel.alpha = 0
                    }
                }else{
                    guard let name = self?.nameTextField.text else { return }
                    guard let email = self?.emailTextField.text else { return }
                    guard let userID = result?.user.uid else { return }
                    let dataBase = Firestore.firestore()
                    let usersRef = dataBase.collection("users")
                    usersRef.document(email).setData([
                        "name": name,
                        "email" : email,
                        "uid" : userID
                    ]) { (error) in
                        if error != nil {
                            self?.errorLabel.text = GlobalString.dataBaseError
                        }
                    }
                    PlayerInfo.shared.userName = name
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
        view.addSubview(deleteNameButton)
        view.addSubview(registerButton)
        view.addSubview(emailTextField)
        view.addSubview(deleteEmailButton)
        view.addSubview(passwordTextField)
        view.addSubview(deletePasswordButton)
        view.addSubview(mainImageView)
        view.addSubview(backButton)
        view.addSubview(repeatPasswordTextField)
        view.addSubview(deleteRepPasswordButton)
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
            return GlobalString.validationError
        }
        return nil
    }
    
    private func checkPasswordValidation() -> Bool {
        if passwordTextField.text != repeatPasswordTextField.text {
            errorLabel.text = GlobalString.passwordValidationError
            return true
        }
        return false
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case nameTextField:
            if nameTextField.text == "" || nameTextField.text != "" {
                deleteNameButton.isHidden = false
            }
        case emailTextField:
            if emailTextField.text == "" || emailTextField.text != "" {
                deleteEmailButton.isHidden = false
            }
        case passwordTextField:
            if passwordTextField.text == "" || passwordTextField.text != "" {
                deletePasswordButton.isHidden = false
            }
        case repeatPasswordTextField:
            if repeatPasswordTextField.text == "" || repeatPasswordTextField.text != "" {
                deleteRepPasswordButton.isHidden = false
            }
        default:
            break
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
         addRule()
        switch textField {
        case nameTextField:
            deleteNameButton.isHidden = true
        case emailTextField:
            deleteEmailButton.isHidden = true
        case passwordTextField:
            deletePasswordButton.isHidden = true
        case repeatPasswordTextField:
            deleteRepPasswordButton.isHidden = true
        default:
            break
        }
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
