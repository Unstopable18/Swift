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
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLable: UILabel!
    var questions=QuestionMultiple.allValues
    var questionNo=0
    var score=0
    var timer:Timer!
    var defaultBackgrounButton: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        defaultBackgrounButton=option2Button.backgroundColor
        // Do any additional setup after loading the view.
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if let userAns = (sender as AnyObject).currentTitle {
            if userAns == "Retake" {
                questionNo = -1
                score = 0
            } else if userAns!.hasPrefix("Your Score is") || userAns!.hasPrefix("Test Complete"){
                questionNo -= 1
            } else if userAns == questions[questionNo].correctAnswer {
                score += 1
                sender.backgroundColor = UIColor.green
            } else {
                sender.backgroundColor = UIColor.red
            }
            questionNo += 1
            
            timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        }
    }

    @objc func updateUI(){
        option1Button.backgroundColor = defaultBackgrounButton
        option2Button.backgroundColor = defaultBackgrounButton
        option3Button.backgroundColor = defaultBackgrounButton
        let progress = Float(questionNo) / Float(questions.count)
        progressBar.setProgress(progress, animated: true)
        if questionNo==questions.count{
            quizFinish()
        }else{
            setQuiz()
        }
    }
    
    func quizFinish(){
        queLable.text=""
        option1Button.setTitle("Test Complete!!!", for: .normal)
        option2Button.setTitle("Your Score is \(score)", for: .normal)
        option3Button.setTitle("Retake", for: .normal)
        scoreLable.text=""
    }
    
    func setQuiz(){
        option1Button.setTitle(questions[questionNo].answer[0], for: .normal)
        option2Button.setTitle(questions[questionNo].answer[1], for: .normal)
        option3Button.setTitle(questions[questionNo].answer[2], for: .normal)
        queLable.text=questions[questionNo].question
        scoreLable.text=String(score)
        
    }
    
}

