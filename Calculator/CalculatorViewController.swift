//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by 施馨檸 on 03/11/2017.
//  Copyright © 2017 施馨檸. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    
    @IBOutlet weak var resultLabel: UILabel!
    
    var totalNum:Double = 0
    var firstNum:Double = 0
    var secondNum:Double = 0
    var stillTyping = false
    var operation = ""
    var input: Double{
        get{
            return Double(resultLabel.text!)!
        }
        set{
            resultLabel.text = "\(newValue)"
            stillTyping = false
        }
    }
    
    // 按下數字按鈕
    @IBAction func digitButtonPressed(_ sender: UIButton) {
        let number = sender.currentTitle!
        
        if stillTyping {
            // 如果是在還沒開始輸入的狀態，就開始輸入數字並放入resultLabel.text
            if resultLabel.text!.characters.count < 16 {
                resultLabel.text = resultLabel.text! + number
            }
            
        } else {
            if number != "0"{
                resultLabel.text = number
                stillTyping = true
            } else {
                resultLabel.text = "0"
                stillTyping = false
            }
        }
    }
    
    @IBAction func operationButtonPressed(_ sender: UIButton) {
        operation = sender.currentTitle!
        stillTyping = false
        firstNum = input
    }
    
    // 取得兩個數字
    func getTwoInputs (operand1: Double, operand2: Double) -> Double{
        switch operation {
        case "+":
            totalNum = operand1 + operand2
        case "-":
            totalNum = operand1 - operand2
        case "×":
            totalNum = operand1 * operand2
        case "÷":
            totalNum = operand1 / operand2
        default:
            break
        }
        return totalNum
    }
    
    // 按下等於
    @IBAction func equalityButton(_ sender: UIButton) {
        secondNum = input
        resultLabel.text = "\(getTwoInputs(operand1: firstNum, operand2: secondNum))"
        
        
    }
    
    // 按下AC按鈕
    @IBAction func clearButtonPressed(_ sender: Any) {
        resultLabel.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
