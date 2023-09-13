//
//  RulesViewController.swift
//  CardWorkout-ProgrammaticUI
//
//  Created by CEMTREX on 13/09/23.
//

import UIKit

class RulesViewController: UIViewController {
    
    let titleLabel      = UILabel()
    let rulesLabel      = UILabel()
    let exerciseLabel   = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTitleLabel()
        configureRuleLabel()
        configureExerciseLabel()
    }
    

    func configureTitleLabel(){
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text                                      = "Rules"
        titleLabel.font                                      = .systemFont(ofSize: 40,weight: .bold)
        titleLabel.textAlignment                             = .center
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func configureRuleLabel(){
        view.addSubview(rulesLabel)
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        rulesLabel.text                                      = "The value of each card represents the number of exercise you do.  J=11, Q=12, K=13, A=14"
        rulesLabel.font                                      = .systemFont(ofSize: 18,weight: .semibold)
        rulesLabel.textAlignment                             = .center
        rulesLabel.numberOfLines                             = 0
        rulesLabel.lineBreakMode                             = .byWordWrapping
        
        NSLayoutConstraint.activate([
            rulesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 20),
            rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func configureExerciseLabel(){
        view.addSubview(exerciseLabel)
        exerciseLabel.translatesAutoresizingMaskIntoConstraints = false
        exerciseLabel.text                                      = "♠️ = Push-up  ❤️ = Sit-up  ♣️ = Burpees  ♦️ = Jumping Jacks"
        exerciseLabel.font                                      = .systemFont(ofSize: 21,weight: .semibold)
        exerciseLabel.textAlignment                             = .natural
        exerciseLabel.numberOfLines                             = 0
        exerciseLabel.lineBreakMode                             = .byWordWrapping
        
        NSLayoutConstraint.activate([
            exerciseLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor,constant: 75),
            exerciseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }


}
