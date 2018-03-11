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
    @IBOutlet weak var subScreenLbt: UILabel!
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
    var isError = false
    var waitingForNewNumber = true
    var firstNumber1InputReady = false
    var firstNumber2InputReady = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        calculator = Calculator(operatorType: .empty, number1: 0.0, number2: 0.0, answer: 0.0)
        screenLbt.text = "0"
        subScreenLbt.text = "Hello!"
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
                if screenText == "0" && buttonText == "0" {
                } else if waitingForNewNumber == true {
                    screenLbt.text = buttonText
                    waitingForNewNumber = false
                } else {
                    screenLbt.text = screenText + buttonText
                }
        }
    }
    
    
    @IBAction func dotButtonPressed(_ sender: Any) {
        if let screenText = screenLbt.text {
            if waitingForNewNumber == true {
                screenLbt.text = "0."
                waitingForNewNumber = false
            } else if screenText.contains(".") {
            } else {
                screenLbt.text = screenText + "."
            }
        }
    }
    
    @IBAction func percentButtonPressed(_ sender: Any) {
        if let screenText = screenLbt.text,
            let screenNum = Double(screenText) {
                if screenNum == 0.0 {
                    screenLbt.text = "0"
                }
                screenLbt.text = String(screenNum * 0.01)
            }
    }
    
    @IBAction func plusMinusButtonPressed(_ sender: Any) {
        if let screenText = screenLbt.text {
            if screenText.first == "-" {
                screenLbt.text = String(screenText.dropFirst())
            } else {
                screenLbt.text = "-" + screenText
            }
        }
    }
    
    @IBAction func plusButtonPressed(_ sender: Any) {
        operatorPressed(operatortype: .plus)
    }
    
    @IBAction func minusButtonPressed(_ sender: Any) {
        operatorPressed(operatortype: .minus)
    }
    
    @IBAction func multipyButtonPressed(_ sender: Any) {
        operatorPressed(operatortype: .multipy)
    }
    
    @IBAction func divideButtonPressed(_ sender: Any) {
        operatorPressed(operatortype: .divide)
    }
    
    func operatorPressed(operatortype: OperatorType) {
        calculator.operatorType = operatortype
        if waitingForNewNumber == false {
            if firstNumber1InputReady == false {
                copyScreenNumberToCalculator(toNumber: 1)
                firstNumber1InputReady = true
            } else if firstNumber1InputReady == true && firstNumber2InputReady == false {
                copyScreenNumberToCalculator(toNumber: 2)
                firstNumber2InputReady = true
            } else {
                copyScreenNumberToCalculator(toNumber: 2)
                calculator.run()
                printToScreen()
                calculator.number1 = calculator.answer
            }
        }
        waitingForNewNumber = true
    }
    
    @IBAction func EqualButtonPressed(_ sender: Any) {
        if waitingForNewNumber == false {
            if firstNumber1InputReady == true && firstNumber2InputReady == false {
                copyScreenNumberToCalculator(toNumber: 2)
                calculator.run()
                printToScreen()
                calculator.number1 = calculator.answer
            } else {
                copyScreenNumberToCalculator(toNumber: 2)
                calculator.run()
                printToScreen()
                calculator.number1 = calculator.answer
            }
        }
        waitingForNewNumber = true
    }
    
    @IBAction func AcButtonPressed(_ sender: Any) {
        subScreenLbt.text = "Hello!"
        screenLbt.text = "0"
        calculator.number1 = 0.0
        calculator.number2 = 0.0
        calculator.answer = 0.0
        calculator.operatorType = .empty
        isError = false
        waitingForNewNumber = true
        firstNumber1InputReady = false
        firstNumber2InputReady = false
    }
    
    func copyScreenNumberToCalculator(toNumber index: Int) {
        if let screenText = screenLbt.text,
            let screenNumber = Double(screenText) {
                if index == 1 {
                    calculator.number1 = screenNumber
                } else if index == 2 {
                    calculator.number2 = screenNumber
                }
        }
    }
    
    func printToScreen() {
        if calculator.operatorType == .divide && calculator.number2 == 0.0 {
            isError = true
        }
        
        if !isError {
            if isDoubleAInt(calculator.answer) {
                screenLbt.text = String(Int(calculator.answer))
            } else {
                screenLbt.text = String(calculator.answer)
            }
            
            switch (calculator.operatorType) {
            case .plus:
                subScreenLbt.text =  "\(calculator.number1) + \(calculator.number2) = \(calculator.answer)"
            case .minus:
                subScreenLbt.text =  "\(calculator.number1) - \(calculator.number2) = \(calculator.answer)"
            case .multipy:
                subScreenLbt.text =  "\(calculator.number1) * \(calculator.number2) = \(calculator.answer)"
            case .divide:
                subScreenLbt.text =  "\(calculator.number1) / \(calculator.number2) = \(calculator.answer)"
            default:
                subScreenLbt.text = "Hello!"
            }
        } else {
            screenLbt.text = "ERROR!"
            subScreenLbt.text = "ERROR!"
        }
    }
    
    func isDoubleAInt(_ number: Double) -> Bool {
        if floor(number) == number {
            return true
        } else {
            return false
        }
    }
}

