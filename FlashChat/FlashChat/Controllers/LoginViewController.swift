    //
    //  LoginViewController.swift
    //  FlashChat
    //
    //  Created by CEMTREX on 29/09/23.
    //

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController{
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextFIeld: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate     = self
        passwordTextFIeld.delegate  = self
    }
}

extension LoginViewController:UITextFieldDelegate{
    
    @IBAction func LoginButtonTapped(_ sender: Any) {
        emailTextField.endEditing(true)
        passwordTextFIeld.endEditing(true)
        if let email=emailTextField.text, let password=passwordTextFIeld.text{
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print("Error while LogIn -> \(e.localizedDescription)")
                }else{
                    self.performSegue(withIdentifier: Constants.loginSegue, sender:self)
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.endEditing(true)
        passwordTextFIeld.endEditing(true)
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
//        textField.text = ""
        
    }
    
}
