//
//  WelcomeViewController.swift
//  FlashChat
//
//  Created by CEMTREX on 29/09/23.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text=Constants.appName
    }
    
}
