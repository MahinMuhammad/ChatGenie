//
//  ChatViewController.swift
//  ChatGenie
//
//  Created by Md. Mahinur Rahman on 5/1/23.
//

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    let messages:[Message] = [
        Message(body: "Hi this a demo bot message", userEmail: Auth.auth().currentUser?.email ?? "a@b.com", senderUserOrBot: K.MessageSender.bot),
        Message(body: "Hi this a user", userEmail: Auth.auth().currentUser?.email ?? "a@b.com", senderUserOrBot: K.MessageSender.user)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        if let titleColor = UIColor(named: K.BrandColor.BrandGreen){
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:titleColor]
        }
        title = Auth.auth().currentUser?.email
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.MessageCell.cellNibName, bundle: nil), forCellReuseIdentifier: K.MessageCell.cellIdentifier)
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
        if let messageBody = messageTextField.text{
            print(messageBody)
        }
        messageTextField.text = ""
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
