//
//  SignUpViewController.swift
//  Today
//
//  Created by Joy on 4/18/20.
//  Copyright © 2020 Joy. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign Up"
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    func showMessage(title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert);let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    @IBAction func signUpButtonClicked(_ sender: Any) {
        if passwordTextField.text != confirmPasswordTextField.text {
            showMessage(title: "NOt match password", message: "check yoru passwrod ")
        }else{
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!){ [weak self] (user, error) in if error == nil {
                // Get user information and save to database
                self?.saveToDatabase()
                
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainTabController")
                vc.modalPresentationStyle = .fullScreen
                self?.present(vc, animated: true)
            }
            else{
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self?.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    func saveToDatabase() {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        let userData: [String: Any?] = [
            "firstName": firstNameTextField.text,
            "lastName": lastNameTextField.text,
            "email": emailTextField.text,
            "userId": userId
        ]
        Database.database().reference()
            .child("Users")
            .child(userId)
        .setValue(userData)
    }
}
