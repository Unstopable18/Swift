//
//  ViewController.swift
//  Tipsy
//
//  Created by CEMTREX on 25/09/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var BillValueLabel: UITextField!
    @IBOutlet weak var SplitLabel: UILabel!
    @IBOutlet weak var Tip20Button: UIButton!
    @IBOutlet weak var Tip10Button: UIButton!
    @IBOutlet weak var Tip0Button: UIButton!
    
    
    var totalBill:Float = 0.0
    var tipPer:String   = "0%"
    var split:Float     = 2
    var share:String    = ""
    var tip:Float       = 0.0
    
    var model=TipsyBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BillValueLabel.delegate=self
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let currentText = (textField.text ?? "") as NSString
        
        let newText = currentText.replacingCharacters(in: range, with: string)

        if newText.isEmpty {
            return true
        } else {

            let decimalSeparator = Locale.current.decimalSeparator ?? "."
            let decimalSeparatorCount = newText.components(separatedBy: decimalSeparator).count - 1
            
            if decimalSeparatorCount > 1 {
                return false
            }
            
            if (Float(newText) != nil) {
                return true
            } else {
                return false
            }
        }
    }
    
//    touches outside the UITextField
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func CalculateSplitButtonTapped(_ sender: UIButton) {
        totalBill   = model.getTotalBill(totalBill: BillValueLabel.text ?? "0")
        split       = model.getSplit(split: SplitLabel.text ?? "2")
        print("From View Controller   totalBill: \(totalBill), tip: \(tip), split: \(split)")
        tip                     = model.getTip(tip: tipPer )
        self.performSegue(withIdentifier: "goToSplit", sender: self)
    }
    
    
    
    @IBAction func TipButtonPressed(_ sender: UIButton) {
        Tip0Button.isSelected   = false
        Tip10Button.isSelected  = false
        Tip20Button.isSelected  = false
        
        sender.isSelected       = true
        tipPer                  = sender.currentTitle ?? "0%"
        
    }
    
    @IBAction func StepperChanged(_ sender: UIStepper) {
        SplitLabel.text         = model.setSplit(split: sender.value)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="goToSplit"{
            let destinationVC       = segue.destination as! TipsyResultViewController
            destinationVC.tipPer    = tipPer
            destinationVC.split     = model.setSplit(split: split)
            destinationVC.share     = model.getShare(totalBill: totalBill, tip: tip, split: split)
        }
    }
}

