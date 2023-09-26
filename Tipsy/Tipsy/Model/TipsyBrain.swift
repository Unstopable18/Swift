//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by CEMTREX on 26/09/23.
//

import UIKit

struct TipsyBrain{
    
    func setSplit(split:Float)->String{
        return String(format: "%.0f", split)
    }
    
    func setSplit(split:Double)->String{
        return String(format: "%.0f", split)
    }
    
    func getTip(tip:String)->Float{
        switch tip {
            case "0%":
                return 1.0
            case "10%":
                return 1.1
            case "20%":
                return 1.2
            default:
                return 0.0
        }
    }
    
    func getTotalBill(totalBill:String)->Float{
        return Float(totalBill) ?? 0.0
    }
    
    func getSplit(split:String)->Float{
        return Float(split) ?? 2.0
    }

    
    func getShare(totalBill:Float,tip:Float,split:Float)->String{
        let share = (totalBill * tip)/split
//        print(share)
        return String(format: "%.2f",share)
    }
}
