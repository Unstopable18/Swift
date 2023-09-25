//
//  model.swift
//  BMI
//
//  Created by CEMTREX on 22/09/23.
//

import UIKit


struct bmiModel{
    var bmi: BMI?
    
    mutating func calculateBMI(height:Float, weight:Float){
        let bmiValue = weight/(height * height)
        if bmiValue < 18.5{
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: .blue)
        }else if bmiValue < 24.9{
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: .green)
        }else{
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: .red)
        }
            
    }
    func getBMI()->String{
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    func getAdvice()->String{
        return bmi?.advice ?? "Advice"
    }
    func getBGColor()->UIColor{
        return bmi?.color ?? .clear
    }
    
}
