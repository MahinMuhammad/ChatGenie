//
//  K.swift
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

import Foundation

struct K{
    struct Segues{
        static let registerSegue = "RegisterToChat"
        static let loginSegue = "LoginToChat"
    }
    
    struct MessageSender{
        static let bot = "bot"
        static let user = "user"
    }
    
    struct BrandColor{
        static let BrandGolden = "Brand Golden"
        static let BrandGreen = "Brand Green"
        static let BrandGrey = "Brand Grey"
        static let BrandLightGolden = "Brand Light Golden"
        static let BrandLightGreen = "Brand Light Green"
    }
    
    struct MessageCell{
        static let cellIdentifier = "ReusableCell"
        static let cellNibName = "CustomMessageCell"
    }
    
    struct FStore{
        static let commonPoolName = "pool"
        static let commonPoolMessageField = "message"
        static let messageCollectionName = "messages"
        static let emailField = "userEmail"
        static let userMessageField = "userMessage"
        static let botReplyField = "botReply"
        static let dateField = "date"
    }
}
