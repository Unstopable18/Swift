//
//  ViewController.swift
//  BMI
//
//  Created by CEMTREX on 22/09/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    var bmiCalculator=bmiModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSlider(_ sender: UISlider) {
        heightLabel.text=String(format: "%.2f", sender.value)+"m"
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        weightLabel.text=String(format: "%.0f",sender.value)+"Kg"
    }
    @IBAction func CalculateButtonTapped(_ sender: Any) {
        let height=heightSlider.value
        let weight=weightSlider.value
        bmiCalculator.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="goToResult"{
            let destinationVC=segue.destination as! ResultViewController
            destinationVC.bmiValue=bmiCalculator.getBMI()
            destinationVC.bmiAdvice=bmiCalculator.getAdvice()
            destinationVC.bmiBGColor=bmiCalculator.getBGColor()
        }
    }
}

