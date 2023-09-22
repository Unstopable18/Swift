//
//  ViewController.swift
//  QuizApp
//
//  Created by CEMTREX on 21/09/23.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var queLable: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLable: UILabel!
    var questions=Question.allValues
    var questionNo=0
    var score=0
    var timer:Timer!
    var defaultBackgrounButton: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        defaultBackgrounButton=trueButton.backgroundColor
        // Do any additional setup after loading the view.
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if let userAns = (sender as AnyObject).currentTitle {
            if userAns == "Retake" {
                questionNo = -1
                score = 0
            } else if userAns!.hasPrefix("Your Score is") {
                questionNo -= 1
            } else if userAns == questions[questionNo].answer {
                score += 1
                sender.backgroundColor = UIColor.green
            } else {
                sender.backgroundColor = UIColor.red
            }
            questionNo += 1
            
            timer = Timer.scheduledTimer(timeInterval: 0.75, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        }
    }

    @objc func updateUI(){
        trueButton.backgroundColor = defaultBackgrounButton
        falseButton.backgroundColor = defaultBackgrounButton
        let progress = Float(questionNo) / Float(questions.count)
        progressBar.setProgress(progress, animated: true)
        if questionNo==questions.count{
            quizFinish()
        }else{
            setQuiz()
        }
    }
    
    func quizFinish(){
        queLable.text="Test Complete!!!"
        trueButton.setTitle("Your Score is \(score)", for: .normal)
        falseButton.setTitle("Retake", for: .normal)
        scoreLable.text=""
    }
    
    func setQuiz(){
        
        trueButton.setTitle("TRUE", for: .normal)
        falseButton.setTitle("FALSE", for: .normal)
        queLable.text=questions[questionNo].text
        scoreLable.text=String(score)
        
    }
    
}

