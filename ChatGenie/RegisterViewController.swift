//
//  RegisterViewController.swift
//  ChatGenie
//
//  Created by Md. Mahinur Rahman on 5/1/23.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerButton.layer.cornerRadius = registerButton.frame.size.height / 2.1
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
