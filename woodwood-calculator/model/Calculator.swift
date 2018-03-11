//
//  Calculator.swift
//  woodwood-calculator
//
//  Created by SHUNPAN LO on 6/3/2018.
//  Copyright © 2018年 bensonlspapp. All rights reserved.
//

import Foundation

enum OperatorType {
    case plus
    case minus
    case multipy
    case divide
    case empty
}

struct Calculator {
    var operatorType: OperatorType
    var number1: Double
    var number2: Double
    var answer: Double
    
    mutating func run() {
        switch operatorType {
        case .plus:
            add()
        case .minus:
            minus()
        case .multipy:
            multipy()
        case .divide:
            divide()
        default: break
        }
    }
    
    mutating func add() {
        answer = number1 + number2
    }
    
    mutating func minus() {
        answer = number1 - number2
    }
    
    mutating func multipy() {
        answer = number1 * number2
    }
    
    mutating func divide() {
        answer = number1 / number2
    }
}


