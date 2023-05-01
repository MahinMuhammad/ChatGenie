//
//  CustomMessageCell.swift
//  ChatGenie
//
//  Created by Md. Mahinur Rahman on 5/1/23.
//

import UIKit

class CustomMessageCell: UITableViewCell {
    @IBOutlet weak var messageBox: UIView!
    @IBOutlet weak var userBadge: UIView!
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
