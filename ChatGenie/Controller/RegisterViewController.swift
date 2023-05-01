//
//  RegisterViewController.swift
//  ChatGenie
//
//  Created by Md. Mahinur Rahman on 5/1/23.
//

import UIKit

import FirebaseAuth
import JVFloatLabeledTextField

class RegisterViewController: UIViewController {
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var emailField: JVFloatLabeledTextField!
    @IBOutlet weak var passwordField: JVFloatLabeledTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerButton.layer.cornerRadius = registerButton.frame.size.height / 2.1
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailField.text, let password = passwordField.text{
            Auth.auth().createUser(withEmail: email, password: password){ authResult, error in
                if let e = error{
                    print("Found error while registering user! \(e)")
                }else{
                    print("User registration successfull!")
                    self.performSegue(withIdentifier: K.Segues.registerSegue, sender: self)
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