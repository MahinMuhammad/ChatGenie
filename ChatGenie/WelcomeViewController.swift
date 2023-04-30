//
//  ViewController.swift
//  ChatGenie
//
//  Created by Md. Mahinur Rahman on 4/30/23.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleLabel.text = ""
        let text = "💡ChatGenie"
        var delayMultiplier = 1.0
        for letter in text{
            Timer.scheduledTimer(withTimeInterval: 0.1*delayMultiplier, repeats: false) {
                (timer) in
                self.titleLabel.text?.append(letter)
            }
            delayMultiplier += 1
        }
    }


}

