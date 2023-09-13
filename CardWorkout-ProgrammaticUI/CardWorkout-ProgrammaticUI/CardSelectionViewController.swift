//
//  CardSelectionViewController.swift
//  CardWorkout-ProgrammaticUI
//
//  Created by CEMTREX on 13/09/23.
//

import UIKit

class CardSelectionViewController: UIViewController {
    
    let cardImageView       = UIImageView()
    let stopButton          = CWButton(color: .systemRed, title: "Stop!",systemImageName: "stop.circle")
    let resetButton         = CWButton(color: .systemGreen, title: "Reset",systemImageName: "arrow.clockwise.circle")
    let ruleButton          = CWButton(color: .systemBlue, title: "Rules",systemImageName: "list.bullet.clipboard")
    var timer: Timer!
    var cards: [UIImage]    = CardDeck.allValues
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configureUI()
        startTimer()
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
    
    func configureUI(){
        configureCardImageView()
        configureStopButton()
        configureResetButton()
        configureRulesButton()
    }
    
    func configureCardImageView(){
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints=false
        cardImageView.image=UIImage(named: "QH")
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    func configureStopButton(){
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant:30)
            
        ])
    }
    
    func configureResetButton(){
        view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(restartButtonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 120),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant:20)
            
        ])
    }
    
    func configureRulesButton(){
        view.addSubview(ruleButton)
        ruleButton.addTarget(self, action: #selector(prepareRulesVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            ruleButton.widthAnchor.constraint(equalToConstant: 120),
            ruleButton.heightAnchor.constraint(equalToConstant: 50),
            ruleButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            ruleButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant:20)
            
        ])
    }
    
    @objc func prepareRulesVC() {
        present(RulesViewController(), animated: true)
    }
    

}
