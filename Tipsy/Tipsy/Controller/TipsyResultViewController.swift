//
//  TipsyResultViewController.swift
//  Tipsy
//
//  Created by CEMTREX on 25/09/23.
//

import UIKit

class TipsyResultViewController: UIViewController {
    
    var tipPer:String!
    var split:String!
    var share:String!
    
    @IBOutlet weak var shareLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text="Split between \(split ?? "2") people, with \(tipPer ?? "0%") tip."
        shareLabel.text=share
        
    }

    @IBAction func recalculateButtonTapped(_ sender: Any) {
        self.dismiss(animated: true,completion: nil)
    }
}
