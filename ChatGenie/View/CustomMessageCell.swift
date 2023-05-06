//
//  CustomMessageCell.swift
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

class CustomMessageCell: UITableViewCell {
    @IBOutlet weak var messageBox: UIView!
    @IBOutlet weak var userBadge: UIView!
    @IBOutlet weak var messageBody: UILabel!
    @IBOutlet weak var botBadge: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        messageBox.layer.cornerRadius = messageBox.frame.size.height / 2.6
        userBadge.layer.cornerRadius = userBadge.frame.size.height / 2
        botBadge.layer.cornerRadius = botBadge.frame.size.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
