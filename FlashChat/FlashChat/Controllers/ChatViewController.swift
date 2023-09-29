//
//  ChatViewController.swift
//  FlashChat
//
//  Created by CEMTREX on 29/09/23.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTextField.delegate  = self
    }
}

extension ChatViewController:UITextFieldDelegate{
    
    @IBAction func SendButtonTapped(_ sender: Any) {
        messageTextField.endEditing(true)
//        performSegue(withIdentifier: "goToChat", sender:nil)
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
        messageTextField.endEditing(true)
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
//        textField.text = ""
        
    }
    
}
