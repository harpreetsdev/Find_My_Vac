//
//  ServiceFactoryTests.swift
//  Find My Vac
//
//  Created by HARPREET SINGH on 11/11/16.
//  Copyright © 2016 HARPREET SINGH. All rights reserved.
//

import XCTest

class ServiceFactoryTests: XCTestCase {
    var factoryInstance : ServiceFactory!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        factoryInstance = ServiceFactory.sharedInstance
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDataWriteFunction() {
       XCTAssertNil(try! factoryInstance.writeDataToPersistentContainer(), "Could not write Data to Persistent container.") 
    }
    
    func testDataReadFunction() {
        let mockReturnArray = try! self.factoryInstance.returnSpecificCategoryVacs(forCategory: "", sortedBy: "")
        XCTAssertNil(mockReturnArray, "Could not return Data")
    }
    
    func testDataReadProcess() {
        // This is an example of a performance test case.
        self.measure {
        try! self.factoryInstance.writeDataToPersistentContainer()
        let _ = try! self.factoryInstance.returnSpecificCategoryVacs(forCategory: "", sortedBy: "")
        }
    }
    
}
