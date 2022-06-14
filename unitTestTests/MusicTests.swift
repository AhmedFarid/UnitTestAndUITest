//
//  MusicTests.swift
//  unitTestTests
//
//  Created by macbook on 13/06/2022.
//

import XCTest
@testable import unitTest

class MusicTests: XCTestCase {
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testParseJson() throws {
    let music = Music()
    let bundle = Bundle(for: type(of: self))
    if let path = bundle.path(forResource: "JSON", ofType: "txt") {
      if let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path)) {
        let result = music.parseJson(data: data)
        
        XCTAssertNotNil(result!)
        XCTAssertGreaterThan(result!.count, 0)
      }else {
        XCTFail()
      }
    }else {
      XCTFail()
    }
  }
  
  func testRefresh() {
    let music = MockMusic()
    music.refresh()
    XCTAssertNotNil(music.cache,"The cache should be nil")
  }
  
  func testFetch() {
    let exp = expectation(description: "server fetch")
    
    let music = Music()
    music.fetchMusic { (items, error) in
      XCTAssertNotNil(items,"items should be nil")
      XCTAssertTrue(items!.count > 0, "items should not be empty")
      exp.fulfill()
    }
    
    waitForExpectations(timeout: 10) { error in
      print(error?.localizedDescription ?? "")
    }
  }
  
  func testPerformanceExample() throws {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}
