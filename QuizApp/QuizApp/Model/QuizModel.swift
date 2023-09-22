//
//  QuizModel.swift
//  QuizApp
//
//  Created by CEMTREX on 22/09/23.
//

import Foundation
import UIKit


class QuizModel{
    
    var questionNo=0
    var score=0
    var questions=QuestionMultiple.allValues
    
    func buttonClickType(_ userAns: String?)->Bool{
        if userAns == "Retake" {
            questionNo = -1
            score = 0
            return true
        } else if userAns!.hasPrefix("Your Score is") || userAns!.hasPrefix("Test Complete"){
            questionNo -= 1
            return true
        }else{
            return false
        }
    }
    
    func answerCheck(_ userAns: String?)->Bool{
        if userAns == questions[questionNo].correctAnswer {
            score += 1
            return true
//            sender.backgroundColor = UIColor.green
        } else {
            return false
//            sender.backgroundColor = UIColor.red
        }
    }
}
