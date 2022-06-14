//
//  MusicPerf.swift
//  unitTestTests
//
//  Created by macbook on 14/06/2022.
//

import XCTest
@testable import unitTest
class MusicPerf: XCTestCase {
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testExample() throws {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    // Any test you write for XCTest can be annotated as throws and async.
    // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
    // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
  }
  
  func testMusic() throws {
    self.measure {
      let exp = expectation(description: "server fetch")
      let music = Music()
      music.fetchMusic { (item,error)  in
        exp.fulfill()
      }
      waitForExpectations(timeout: 10.0) { (error) in
        print(error?.localizedDescription ?? "")
      }
    }
  }
  
}
