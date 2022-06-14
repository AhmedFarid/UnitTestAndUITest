//
//  unitTestTests.swift
//  unitTestTests
//
//  Created by macbook on 13/06/2022.
//

import XCTest
@testable import unitTest

class unitTestTests: XCTestCase {
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testExample() throws {
    let tc = TipCalc()
    let tip = tc.calcTip(amount: 100.0, tipPerc: 50.0)
    XCTAssertEqual(50.0, tip, "tip was wrong for 50%")
  }
  
  func testUnitTest() {
    var x: Int
    x = 1
    XCTAssertTrue(x == 1)
  }
  
  func testPerformanceExample() throws {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}
