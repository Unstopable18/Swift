//
//  Questions.swift
//  QuizApp
//
//  Created by CEMTREX on 21/09/23.
//

import Foundation
struct Question {
    let text: String
    let answer: String
}

extension Question {
    static var allValues=[
        Question(text: "A slug's blood is green.", answer: "TRUE"),
        Question(text: "Approximately one quarter of human bones are in the feet.", answer: "TRUE"),
        Question(text: "The total surface area of two human lungs is approximately 70 square metres.", answer: "TRUE"),
        Question(text: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer: "TRUE"),
        Question(text: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: "FALSE"),
        Question(text: "It is illegal to pee in the Ocean in Portugal.", answer: "TRUE"),
        Question(text: "You can lead a cow down stairs but not up stairs.", answer: "FALSE"),
        Question(text: "Google was originally called 'Backrub'.", answer: "TRUE"),
        Question(text: "Buzz Aldrin's mother's maiden name was 'Moon'.", answer: "TRUE"),
        Question(text: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answer: "FALSE"),
        Question(text: "No piece of square dry paper can be folded in half more than 7 times.", answer: "FALSE"),
        Question(text: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answer: "TRUE")
    ]
}
