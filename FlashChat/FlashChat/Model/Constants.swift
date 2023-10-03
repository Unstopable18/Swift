//
//  Constants.swift
//  FlashChat
//
//  Created by CEMTREX on 03/10/23.
//

import Foundation

struct Constants{
    static let registerSegue    = "goToChatRegister"
    static let loginSegue       = "goToChatLogin"
    static let appName          = "⚡️FlashChat"
    static let cellIdentifier   = "ReusableCell"
    static let cellNibName      = "MessageCell"
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
}
