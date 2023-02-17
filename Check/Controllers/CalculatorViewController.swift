//
//  ViewController.swift
//  Check
//
//  Created by Mac OS on 14.02.2023.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var percent = 0.0
    var countPeoples = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    @IBAction func tipChanger(_ sender: UIButton) {
        billTextField.endEditing(true)
        switch sender.tag {
        case 1: zeroPctButton.isSelected = true;
                tenPctButton.isSelected = false;
                twentyPctButton.isSelected = false;
                percent = 0.0
        case 2: zeroPctButton.isSelected = false;
                tenPctButton.isSelected = true;
                twentyPctButton.isSelected = false;
                percent = 0.1
        case 3: zeroPctButton.isSelected = false;
                tenPctButton.isSelected = false;
                twentyPctButton.isSelected = true;
                percent = 0.2
        default:
            break
        }
    }
    
    @IBAction func stepperValueChanger(_ sender: UIStepper) {
        countPeoples = Int(Int(sender.value))
        splitNumberLabel.text =  String(countPeoples)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        
        if bill != "" {
            let formatter = NumberFormatter()
            formatter.locale = Locale.current

            if let number = formatter.number(from: bill) {
                billTotal = number.doubleValue // - > a = 3.43255
            }

            let count = billTotal * (1 + percent) / Double(countPeoples)
            finalResult = String(format: "%.2f", count)
            print(finalResult)
        }
    self.performSegue(withIdentifier: "goToResult", sender: self)
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = finalResult
            destinationVC.people = countPeoples
            destinationVC.percent = Int(percent * 100)
        }
    }
}

