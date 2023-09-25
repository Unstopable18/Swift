//
//  ViewController.swift
//  Tipsy
//
//  Created by CEMTREX on 25/09/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var BillValueLabel: UITextField!
    @IBOutlet weak var SplitLabel: UILabel!
    @IBOutlet weak var Tip20Button: UIButton!
    @IBOutlet weak var Tip10Button: UIButton!
    @IBOutlet weak var Tip0Button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func CalculateSplitButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToSplit", sender: self)
    }
    
    @IBAction func TipButtonPressed(_ sender: UIButton) {
        Tip0Button.isSelected=false
        Tip10Button.isSelected=false
        Tip20Button.isSelected=false
        sender.isSelected=true
//        let tip=sender.currentTitle
//        if tip=="0%"{
//            sender.isSelected=true
//        }else if tip=="10%"{
//            sender.isSelected=true
//        }else if tip=="20%"{
//            sender.isSelected=true
//        }else{
//            sender.isSelected=false
//        }
    }
    
    @IBAction func StepperChanged(_ sender: UIStepper) {
        
        SplitLabel.text = String(format: "%.0f", sender.value)
    }
}

