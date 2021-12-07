//
//  BaseViewController.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 06.12.2021.
//

import UIKit

class BaseViewController : UIViewController {
    
    let nc = NotificationCenter.default
    
    deinit {
        removeObserver()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        addObserver()
        swipeDown()
    }
    
    
    private func configure() {
        view.backgroundColor = .white
    }
    
    //MARK:- Notification
    
    private func addObserver() {
        nc.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    private func removeObserver() {
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}


//MARK:- Keyboard
extension BaseViewController {
    
    
    @objc private func keyboardWillShow(_ notification: Notification){
        let rect = keyboardRect(from: notification)
        keyboardIsVisible(keyboardHeight: rect.height, keyboardWeight: rect.width)
        view.layoutIfNeeded()
    }
    
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        let rect = keyboardRect(from: notification)
        keyboardIsHidden(keyboardHeight: rect.height, keyboardWeight: rect.width)
        view.layoutIfNeeded()
    }
    
    @objc private func keyboardRect(from notification : Notification) -> CGRect {
        guard let userInfo = notification.userInfo,
              let keyboardRectangle = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {return CGRect()}
        return keyboardRectangle
        
    }
    
    @objc private func keyboardIsVisible(keyboardHeight: CGFloat, keyboardWeight:CGFloat) {}
    
    @objc private func keyboardIsHidden(keyboardHeight: CGFloat, keyboardWeight:CGFloat) {}
}
// MARK: - UIGestureRecognizerDelegate

extension BaseViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    func swipeDown() {
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(hideKeyboardOnSwipeDown))
        swipeDown.delegate = self
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        view.addGestureRecognizer(swipeDown)
    }

    @objc func hideKeyboardOnSwipeDown() {
        view.endEditing(true)
    }
    @objc func hideKeyboardonTouch() {
        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true);
        }
    
   
}
