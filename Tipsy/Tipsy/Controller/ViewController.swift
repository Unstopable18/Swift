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
    
    @IBOutlet var tipButtons: [UIButton]!
    
    var totalBill:Float = 0.0
    var tipPer:String   = "0%"
    var split:Float     = 2
    var share:String    = ""
    var tip:Float       = 0.0
    
    var model=TipsyBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func CalculateSplitButtonTapped(_ sender: UIButton) {
        BillValueLabel.endEditing(true)
        totalBill   = model.getTotalBill(totalBill: BillValueLabel.text ?? "0")
        split       = model.getSplit(split: SplitLabel.text ?? "2")
//        print("totalBill: \(totalBill), tip: \(tip), split: (split)")
        share       = model.getShare(totalBill: totalBill, tip: tip, split: split)
        
        self.performSegue(withIdentifier: "goToSplit", sender: self)
    }
    
    @IBAction func TipButtonPressed(_ sender: UIButton) {
        
        BillValueLabel.endEditing(true)
 
        Tip0Button.isSelected   = false
        Tip10Button.isSelected  = false
        Tip20Button.isSelected  = false
        
        sender.isSelected       = true
        tipPer                  = sender.currentTitle ?? "0%"
        tip                     = model.getTip(tip: tipPer )
        
    }
    
    @IBAction func StepperChanged(_ sender: UIStepper) {
        BillValueLabel.endEditing(true)
        SplitLabel.text         = model.setSplit(split: sender.value)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="goToSplit"{
            let destinationVC       = segue.destination as! TipsyResultViewController
            destinationVC.tipPer    = tipPer
            destinationVC.split     = model.setSplit(split: split)
            destinationVC.share     = share
        }
    }
}

