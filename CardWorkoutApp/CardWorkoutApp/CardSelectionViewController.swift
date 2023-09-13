//
//  CardSelectionViewController.swift
//  CardWorkoutApp
//
//  Created by CEMTREX on 12/09/23.
//

import UIKit

class CardSelectionViewController: UIViewController {
    
    @IBOutlet weak var cardImageView: UIImageView!
    
    @IBOutlet var buttons: [UIButton]!
    
    var timer: Timer!
    
    var cards: [UIImage] = Card.allValues
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()

        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer(){
        timer=Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage(){
        cardImageView.image = cards.randomElement() ?? UIImage(named: "JH")
    }
    
    @IBAction func stopButtonTapped(_ sender: Any) {
        timer.invalidate()
   
    }
    
    @IBAction func restartButtonTapped(_ sender: Any) {
        timer.invalidate()
        startTimer()
    }
    
}
