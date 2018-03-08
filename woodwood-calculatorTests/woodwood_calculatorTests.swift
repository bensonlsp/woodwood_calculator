//
//  woodwood_calculatorTests.swift
//  woodwood-calculatorTests
//
//  Created by SHUNPAN LO on 8/3/2018.
//  Copyright © 2018年 bensonlspapp. All rights reserved.
//

import XCTest
@testable import woodwood_calculator

class woodwood_calculatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testAdd() {
        let cal = Calculator(number1: 0.0, number2: 0.0, sum: 0.0, operatorPressed: false, operatorType: .empty)
        XCTAssert(cal.isDoubleAInt(0.0) == true)
        XCTAssert(cal.isDoubleAInt(1.1) == false)
        XCTAssert(cal.isDoubleAInt(2.0) == true)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
