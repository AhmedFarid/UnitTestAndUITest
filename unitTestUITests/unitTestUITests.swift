//
//  unitTestUITests.swift
//  unitTestUITests
//
//  Created by macbook on 13/06/2022.
//

import XCTest

class unitTestUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMyPerfTest() throws {
      
      let app = XCUIApplication()
      print(app.debugDescription)
      
      let lbl = app.staticTexts["MyLabel"]
      print(lbl.label)
      app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
      
      let textField = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element
      textField.tap()
      
      XCTAssertTrue(lbl.label.hasPrefix("tip"), "tip is missing")
      
      let key = app/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
      key.tap()
      key.tap()
      textField.tap()
      textField.tap()
      
      let key2 = app/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
      key2.tap()
      key2.tap()
      key2.tap()
      key2.tap()
      key2.tap()
      key2.tap()
      key2.tap()
      key2.tap()
      key2.tap()
      app/*@START_MENU_TOKEN@*/.staticTexts["Calc"]/*[[".buttons[\"Calc\"].staticTexts[\"Calc\"]",".staticTexts[\"Calc\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
