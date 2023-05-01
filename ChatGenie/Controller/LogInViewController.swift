//
//  LogInViewController.swift
//  ChatGenie
//
//  Created by Md. Mahinur Rahman on 5/1/23.
//

import UIKit
import JVFloatLabeledTextField
import FirebaseAuth

class LogInViewController: UIViewController {
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var emailField: JVFloatLabeledTextField!
    @IBOutlet weak var passwordField: JVFloatLabeledTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        logInButton.layer.cornerRadius = logInButton.frame.size.height / 2.1
    }
    
    @IBAction func logInPressed(_ sender: UIButton) {
        if let email = emailField.text, let password = passwordField.text{
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    print("LogIn failed with error: \(e)")
                }else{
                    print("LogIn Successful")
                    self.performSegue(withIdentifier: K.Segues.loginSegue, sender: self)
                }
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
