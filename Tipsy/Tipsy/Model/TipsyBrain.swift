//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by CEMTREX on 26/09/23.
//

import UIKit

struct TipsyBrain{
    
    func setSplit(split:Double)->String{
        return String(format: "%.0f", split)
    }
    
    func getTip(tip:String)->Double{
        switch tip {
            case "0%":
                return 1
            case "10%":
                return 1.1
            case "20%":
                return 1.2
            default:
                return 0
        }
    }
    
    func getTotalBill(totalBill:String)->Double{
        return Double(totalBill) ?? 0
    }
    
    func getSplit(split:String)->Double{
        return Double(split) ?? 2
    }

    
    func getShare(totalBill:Double,tip:Double,split:Double)->String{
        let share = (totalBill * tip)/split
        if share.truncatingRemainder(dividingBy: 1.0) != 0 {
            return String(format: "%.2f", share)
        } else {
            return String(format: "%.0f", share)
        }
    }
}
