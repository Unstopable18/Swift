    //
    //  RegisterViewController.swift
    //  FlashChat
    //
    //  Created by CEMTREX on 29/09/23.
    //

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate     = self
        passwordTextField.delegate  = self
    }
}

extension RegisterViewController:UITextFieldDelegate{
    
    @IBAction func RegisterButtonTapped(_ sender: Any) {
        emailTextField.endEditing(true)
        passwordTextField.endEditing(true)
        if let email=emailTextField.text, let password=passwordTextField.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print("Error while registering -> \(e.localizedDescription)")
                }else{
                    self.performSegue(withIdentifier: Constants.registerSegue, sender:self)
                }
            }
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool{
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.endEditing(true)
        passwordTextField.endEditing(true)
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
//        textField.text = ""
        
    }
    
}

