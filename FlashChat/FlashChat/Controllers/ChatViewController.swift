    //
    //  ChatViewController.swift
    //  FlashChat
    //
    //  Created by CEMTREX on 29/09/23.
    //

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    let db=Firestore.firestore()
    
//    var messages: [Message] = [
//        Message(sender: "1@2.com", body: "Hey!"),
//        Message(sender: "a@b.com", body: "Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!"),
//        Message(sender: "1@2.com", body: "What's up?")
//    ]
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton  = true
        messageTextField.delegate       = self
        tableView.dataSource            = self
        tableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        loadMessages()
    }
    
    func loadMessages(){
        
        db.collection(Constants.FStore.collectionName)
            .order(by: Constants.FStore.dateField)
            .addSnapshotListener() { (querySnapshot, err) in
            self.messages=[]
            if let err = err {
                print("Error getting data from Firestore: \(err)")
            } else {
                if let snapshotDocuments=querySnapshot?.documents{
                    for doc in snapshotDocuments {
//                        print("\(doc.documentID) => \(doc.data())")
                        let data=doc.data()
                        if let messageSender=data[Constants.FStore.senderField] as? String, let messageBody=data[Constants.FStore.bodyField] as? String{
                            let newMessage=Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                            
                            
                        }
                        
                    }
                }
            }
        }
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

extension ChatViewController:UITextFieldDelegate{
    
    @IBAction func SendButtonTapped(_ sender: Any) {
        
//        print("Send Button Tapped")
        messageTextField.endEditing(true)
        if let messageBody=messageTextField.text, let messageSender=Auth.auth().currentUser?.email{
            var ref: DocumentReference? = nil
            ref = db.collection(Constants.FStore.collectionName).addDocument(data: [
                Constants.FStore.senderField:messageSender,
                Constants.FStore.bodyField:messageBody,
                Constants.FStore.dateField:Date().timeIntervalSince1970
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    self.messageTextField.text = ""
//                    print("Document added with ID: \(ref!.documentID)")
                }
            }
            
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        messageTextField.endEditing(true)
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
            //        textField.text = ""
        
    }
    
}

extension ChatViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = messages[indexPath.row]
                
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MessageCell
        cell.messageLabel.text = message.body
        
        //This is a message from the current user.
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.MessageBubble.backgroundColor = UIColor(named: Constants.BrandColors.lightPurple)
            cell.messageLabel.textColor = UIColor(named: Constants.BrandColors.purple)
        }
        //This is a message from another sender.
        else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.MessageBubble.backgroundColor = UIColor(named: Constants.BrandColors.blue)
            cell.messageLabel.textColor = UIColor(named: Constants.BrandColors.lightBlue)
        }
        
      
      
        return cell
    }
    
    
}

