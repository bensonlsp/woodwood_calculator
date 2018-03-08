//
//  Calculator.swift
//  woodwood-calculator
//
//  Created by SHUNPAN LO on 6/3/2018.
//  Copyright © 2018年 bensonlspapp. All rights reserved.
//

import Foundation

struct Calculator {
    var number1: Double
    var number2: Double
    var sum: Double
    var operatorPressed: Bool
    var operatorType: OperatorType
}

enum OperatorType {
    case plus
    case minus
    case multipy
    case divide
    case empty
}
