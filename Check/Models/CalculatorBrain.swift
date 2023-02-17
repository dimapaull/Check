//
//  CalculatorBrain.swift
//  Check
//
//  Created by Mac OS on 14.02.2023.
//

import Foundation

struct CalculaterBrain {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    mutating func calculateBMI(height: Float, weight: Float){
        let BMIValue = weight / (height * height)
        
        if BMIValue < 18.5{
            bmi = BMI(value: BMIValue, advice: "Eat more!", color: UIColor.blue)
        } else if BMIValue < 24.5 {
            bmi = BMI(value: BMIValue, advice: "Normal!", color: UIColor.green)
        } else {
            bmi = BMI(value: BMIValue, advice: "Eat less!", color: UIColor.red)
        }
    }
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.gray
    }
}
