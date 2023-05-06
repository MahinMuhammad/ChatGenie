//
//  ChatViewController.swift
//  ChatGenie
//
//  Created by Md. Mahinur Rahman on 5/1/23.
//

/**
 Copyright 2023 Md. Mahinur Rahman

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    let db = Firestore.firestore()
    weak var listener: ListenerRegistration?
    
    var messages:[Message] = [
        Message(body: "Hi I am Chat Genie. How can I assist you?", userEmail: Auth.auth().currentUser?.email ?? "general notice", senderUserOrBot: K.MessageSender.bot)
    ]
    
    var botMessagePool:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        if let titleColor = UIColor(named: K.BrandColor.BrandGreen){
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:titleColor]
        }
        title = Auth.auth().currentUser?.email
        
        populateBotMessagePool()
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.MessageCell.cellNibName, bundle: nil), forCellReuseIdentifier: K.MessageCell.cellIdentifier)
        
        loadMessages()
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
          try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextField.text, let userEmail = Auth.auth().currentUser?.email{
            let firestoreCollection = db.collection(K.FStore.messageCollectionName)
            firestoreCollection.addDocument(data: [
                K.FStore.emailField : userEmail,
                K.FStore.userMessageField : messageBody,
                K.FStore.botReplyField : getReply(),
                K.FStore.dateField : Date().timeIntervalSince1970
            ]){(error) in
                if let e = error{
                    print(e)
                }else{
                    print("Data saved")
                }
            }
        }
        messageTextField.text = ""
    }
    
    func getReply()->String{
        return botMessagePool.randomElement() ?? "I am sleeping now"
    }
    
    func populateBotMessagePool(){
        db.collection(K.FStore.commonPoolName).getDocuments { querySnapshot, error in
            if let e = error{
                print("Error loading messages from common pool. Error: \(e)")
            }else{
                print("Data retrived")
                if let snapshotDocuments = querySnapshot?.documents{
                    for doc in snapshotDocuments{
                        let data = doc.data()
                        if let message = data[K.FStore.commonPoolMessageField] as? String{
                            self.botMessagePool.append(message)
                        }
                    }
                }
            }
        }
    }
    
    func loadMessages(){
        let firestoreCollection = db.collection(K.FStore.messageCollectionName)
        if let currentUserEmail = Auth.auth().currentUser?.email{
            let userDataCollection = firestoreCollection.whereField(K.FStore.emailField, isEqualTo: currentUserEmail)
            let sortedDataCollection = userDataCollection.order(by: K.FStore.dateField)
            listener = sortedDataCollection.addSnapshotListener({ querySnapshot, error in
                if self.messages.count != 1{  //checking If the messages has the first welcome message or not
                    self.messages = []
                }
                if let e = error{
                    print("Found error loading messages. Error: \(e)")
                }else{
                    if let snapshotDocuments = querySnapshot?.documents{
                        for doc in snapshotDocuments{
                            let data = doc.data()
                            if let userEmail = data[K.FStore.emailField] as? String, let userMessageBody = data[K.FStore.userMessageField] as? String, let botReplyBody = data[K.FStore.botReplyField] as? String{
                                let userMessage = Message(body: userMessageBody, userEmail: userEmail, senderUserOrBot: K.MessageSender.user)
                                let botReply = Message(body: botReplyBody, userEmail: userEmail, senderUserOrBot: K.MessageSender.bot)
                                self.messages.append(userMessage)
                                self.messages.append(botReply)
                                
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                    
                                    let index = IndexPath(row: self.messages.count - 1, section: 0)
                                    self.tableView.scrollToRow(at: index, at: .top, animated: true)
                                }
                            }
                        }
                    }
                }
            })
        }
    }
}

//MARK: - UITableViewDataSource

extension ChatViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.MessageCell.cellIdentifier, for: indexPath) as! CustomMessageCell
        
        cell.messageBody.text = message.body
        
        if message.senderUserOrBot == K.MessageSender.user{
            cell.botBadge.isHidden = true
            cell.userBadge.isHidden = false
            cell.messageBox.backgroundColor = UIColor(named: K.BrandColor.BrandLightGreen)
            cell.messageBody.textColor = UIColor(named: K.BrandColor.BrandGreen)
        }else{
            cell.botBadge.isHidden = false
            cell.userBadge.isHidden = true
            cell.messageBox.backgroundColor = UIColor(named: K.BrandColor.BrandGrey)
            cell.messageBody.textColor = UIColor(named: K.BrandColor.BrandGreen)
        }
        
        return cell
    }
}
