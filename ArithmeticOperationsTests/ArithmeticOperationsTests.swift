//
//  ArithmeticOperationsTests.swift
//  ArithmeticOperationsTests
//
//  Created by Sergey Kemenov on 13.06.2023.
//

import XCTest

struct ArithmeticsOperations {
    // async execution method
    func addition(num1: Int, num2: Int, handler: @escaping (Int) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            handler(num1 + num2)
        }
    }
    
    // sync / ordinary execution method
    func subtraction(num1: Int, num2: Int) -> Int {
        num1 - num2
    }
    
    func multiplication(num1: Int, num2: Int) -> Int {
        num1 * num2
    }
}



final class ArithmeticOperationsTests: XCTestCase {
    // async test case
    func testAddition() throws {
        
        // given
        let arithmeticOperations = ArithmeticsOperations()
        let num1 = 1
        let num2 = 2
        
        //when
        let expectation = expectation(description: "Addition function expextation") // using this for waiting
        arithmeticOperations.addition(num1: num1, num2: num2) { result in
            
            //then
            XCTAssertEqual(result, 3)
            expectation.fulfill() // flag that we can stop waiting
        }
        waitForExpectations(timeout: 2) // need to wait this time (in secs)
    }
    
    // sync / ordinary test case
    func testSubtraction() {
        //given
        let arithmeticOperations = ArithmeticsOperations()
        let num1 = 4
        let num2 = 2
        
        //when
        let result = arithmeticOperations.subtraction(num1: num1, num2: num2)
        
        //then
        XCTAssertEqual(result, 2)
    }
}

