//
//  ViewController.swift
//  woodwood-calculator
//
//  Created by SHUNPAN LO on 4/3/2018.
//  Copyright © 2018年 bensonlspapp. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var screenLbt: UILabel!
    @IBOutlet weak var acBtn: UIButton!
    @IBOutlet weak var plusMinusBtn: UIButton!
    @IBOutlet weak var percentageBtn: UIButton!
    @IBOutlet weak var divisionBtn: UIButton!
    @IBOutlet weak var SevenBtn: UIButton!
    @IBOutlet weak var EightBtn: UIButton!
    @IBOutlet weak var NineBtn: UIButton!
    @IBOutlet weak var MultiplyBtn: UIButton!
    @IBOutlet weak var FourBtn: UIButton!
    @IBOutlet weak var FiveBtn: UIButton!
    @IBOutlet weak var SixBtn: UIButton!
    @IBOutlet weak var MinusBtn: UIButton!
    @IBOutlet weak var OneBtn: UIButton!
    @IBOutlet weak var TwoBtn: UIButton!
    @IBOutlet weak var ThreeBtn: UIButton!
    @IBOutlet weak var PlusBtn: UIButton!
    @IBOutlet weak var ZeroBtn: UIButton!
    @IBOutlet weak var DotBtn: UIButton!
    @IBOutlet weak var EqualBtn: UIButton!
    
    var calculator: Calculator!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        calculator = Calculator(number1: 0.0, number2: 0.0, sum: 0.0, operatorPressed: false, operatorType: .empty)
        screenLbt.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func NumberButtonPressed(_ sender: Any) {
        if let buttonPressed = sender as? UIButton,
            let buttonTitleLabel = buttonPressed.titleLabel,
            let buttonText = buttonTitleLabel.text,
            let screenText = screenLbt.text {
            if screenText == "0" || calculator.operatorPressed == true {
                screenLbt.text = buttonText
                calculator.operatorPressed = false
            } else {
                screenLbt.text = screenText + buttonText
            }
        }
    }
    
    
    @IBAction func plusButtonPressed(_ sender: Any) {
        copyScreenTxtToCalNum1()
        calculator.operatorType = .plus
    }
    
    @IBAction func minusButtonPressed(_ sender: Any) {
        copyScreenTxtToCalNum1()
        calculator.operatorType = .minus
    }
    
    @IBAction func multipyButtonPressed(_ sender: Any) {
        copyScreenTxtToCalNum1()
        calculator.operatorType = .multipy
    }
    
    @IBAction func divideButtonPressed(_ sender: Any) {
        copyScreenTxtToCalNum1()
        calculator.operatorType = .divide
    }
    
    
    @IBAction func EqualButtonPressed(_ sender: Any) {
        if let screenText = screenLbt.text,
            let screenNumber = Double(screenText) {
            calculator.number2 = screenNumber
        }
        
        if calculator.operatorType == .plus {
            calculator.sum = calculator.number1 + calculator.number2
        }
        if calculator.operatorType == .minus {
            calculator.sum = calculator.number1 - calculator.number2
        }
        if calculator.operatorType == .multipy {
            calculator.sum = calculator.number1 * calculator.number2
        }
        if calculator.operatorType == .divide {
            if calculator.number2 == 0 {
                screenLbt.text = "ERROR!"
            } else {
                calculator.sum = calculator.number1 / calculator.number2
            }
        }
        
        print("Num1: \(calculator.number1), Num2: \(calculator.number2), Sum: \(calculator.sum)")
        if floor(calculator.sum) == calculator.sum {
            screenLbt.text = String(Int(calculator.sum))
        } else {
            screenLbt.text = String(calculator.sum)
        }
        
    }
    
    @IBAction func AcButtonPressed(_ sender: Any) {
        screenLbt.text = "0"
        calculator.number1 = 0.0
        calculator.number2 = 0.0
        calculator.sum = 0.0
        calculator.operatorPressed = false
        calculator.operatorType = .empty
    }
    
    func copyScreenTxtToCalNum1() {
        if let screenText = screenLbt.text,
            let screenNumber = Double(screenText) {
            calculator.number1 = screenNumber
        }
        calculator.operatorPressed = true
    }
    
}

