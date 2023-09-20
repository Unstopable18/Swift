//
//  ViewController.swift
//  Dicee
//
//  Created by CEMTREX on 18/09/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var DiceImageViewOne: UIImageView!
    @IBOutlet weak var DiceImageViewTwo: UIImageView!
    var roller: Timer!
    var rollerStop: Timer!
    var dice: [UIImage] = Dice.allValues
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func rollButtonTapped(_ sender: Any) {
        startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        roller.invalidate()
    }
    
    func startTimer(){
        rollerStop=Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(stopTimer), userInfo: nil, repeats: false)
        roller=Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage(){
        DiceImageViewOne.image = dice.randomElement() ?? UIImage(named: "DiceSix")
        
        DiceImageViewTwo.image = dice.randomElement() ?? UIImage(named: "DiceFour")
    }
    
    @objc func stopTimer() {
        roller.invalidate()
    }
}

