//
//  GettyImagesUITests.swift
//  GettyImagesUITests
//
//  Created by Mohamed Magdy on 7/15/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import XCTest

class GettyImagesUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUI() {
        let app = XCUIApplication()
        let table = app.tables.element(boundBy: 0)
        let lastCell = table.cells.element(boundBy: 9)
        table.scrollToElement(element: lastCell)
        XCTAssertFalse(table.cells.count == 0)
    }
    
}

extension XCUIElement {
    func scrollToElement(element: XCUIElement) {
        for _ in 0..<10 {
            swipeUp()
        }
    }
   
}
