//
//  InputViewControllerTests.swift
//  Find My Vac
//
//  Created by Singh, Harpreet on 11/10/16.
//  Copyright © 2016 HARPREET SINGH. All rights reserved.
//

import XCTest
import UIKit

class InputViewControllerTests: XCTestCase {
    
    let viewControllerToTest : InputViewController! = nil
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let viewControllerTotest = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InputVC") as? InputViewController
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testViewControllerExists() {
        
        XCTAssertNil(viewControllerToTest, "Could not initialize the Input View Controller")

    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
