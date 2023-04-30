//
//  LogInViewController.swift
//  ChatGenie
//
//  Created by Md. Mahinur Rahman on 5/1/23.
//

import UIKit

class LogInViewController: UIViewController {
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        logInButton.layer.cornerRadius = logInButton.frame.size.height / 2.1
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
