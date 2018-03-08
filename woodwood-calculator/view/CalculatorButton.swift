//
//  CalculatorButton.swift
//  woodwood-calculator
//
//  Created by SHUNPAN LO on 6/3/2018.
//  Copyright © 2018年 bensonlspapp. All rights reserved.
//

import UIKit

@IBDesignable

class CalculatorButton: UIButton {

    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    func customizeView() {
        layer.cornerRadius = 5.0
    }

}
