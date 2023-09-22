//
//  Questions.swift
//  QuizApp
//
//  Created by CEMTREX on 21/09/23.
//

import Foundation
struct QuestionBoolean {
    let question: String
    let answer: String
}
struct QuestionMultiple {
    let question: String
    let answer: [String]
    let correctAnswer: String
}

extension QuestionBoolean {
    static var allValues=[
        QuestionBoolean(question: "A slug's blood is green.", answer: "TRUE"),
        QuestionBoolean(question: "Approximately one quarter of human bones are in the feet.", answer: "TRUE"),
        QuestionBoolean(question: "The total surface area of two human lungs is approximately 70 square metres.", answer: "TRUE"),
        QuestionBoolean(question: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer: "TRUE"),
        QuestionBoolean(question: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: "FALSE"),
        QuestionBoolean(question: "It is illegal to pee in the Ocean in Portugal.", answer: "TRUE"),
        QuestionBoolean(question: "You can lead a cow down stairs but not up stairs.", answer: "FALSE"),
        QuestionBoolean(question: "Google was originally called 'Backrub'.", answer: "TRUE"),
        QuestionBoolean(question: "Buzz Aldrin's mother's maiden name was 'Moon'.", answer: "TRUE"),
        QuestionBoolean(question: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answer: "FALSE"),
        QuestionBoolean(question: "No piece of square dry paper can be folded in half more than 7 times.", answer: "FALSE"),
        QuestionBoolean(question: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answer: "TRUE")
    ]
}
extension QuestionMultiple {
    
    static var allValues=[
        QuestionMultiple(question: "Which is the largest organ in the human body?", answer: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        QuestionMultiple(question: "Five dollars is worth how many nickels?", answer: ["25", "50", "100"], correctAnswer: "100"),
        QuestionMultiple(question: "What do the letters in the GMT time zone stand for?", answer: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        QuestionMultiple(question: "What is the French word for 'hat'?", answer: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        QuestionMultiple(question: "In past times, what would a gentleman keep in his fob pocket?", answer: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        QuestionMultiple(question: "How would one say goodbye in Spanish?", answer: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        QuestionMultiple(question: "Which of these colours is NOT featured in the logo for Google?", answer: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        QuestionMultiple(question: "What alcoholic drink is made from molasses?", answer: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        QuestionMultiple(question: "What type of animal was Harambe?", answer: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        QuestionMultiple(question: "Where is Tasmania located?", answer: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    
}
