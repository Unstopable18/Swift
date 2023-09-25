//
//  ResultViewController.swift
//  BMI
//
//  Created by CEMTREX on 25/09/23.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var BMILabel: UILabel!
    @IBOutlet weak var DescriptionLabel: UILabel!
    
    var bmiValue:String!
    var bmiAdvice:String!
    var bmiBGColor: UIColor!
    override func viewDidLoad() {
        super.viewDidLoad()
        BMILabel.text=bmiValue
        DescriptionLabel.text=bmiAdvice
        view.backgroundColor=bmiBGColor
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func RecalculateButtonTapped(_ sender: Any) {
        self.dismiss(animated: true,completion: nil)
    }
    


}
