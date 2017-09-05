//
//  GettyImagesTests.swift
//  GettyImagesTests
//
//  Created by Mohamed Magdy on 7/15/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import XCTest
@testable import GettyImages

class GettyImagesTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
//    func testAPIResponse() {
//        
//        let expectations: XCTestExpectation = expectation(description: "Testing GettyImages API")
//        let imageStore  : GIImageStore      = GIImageStore()
//        imageStore.getImagesInPage(page: 1, searchPhrase: nil, success: { (model) in
//          
//            let images: [GIImageViewModel]? = model as? [GIImageViewModel]
//            XCTAssertNotNil(images)
//            XCTAssert(images?.count == 10)
//            XCTAssertNotNil(images?.first?.imageTitle)
//            expectations.fulfill()
//        }) { (error) in
//            XCTFail("##ERROR happened: \(error)")
//            expectations.fulfill()
//        }
//        
//        waitForExpectations(timeout: 10.0) { error in
//            if let error = error {
//                XCTFail("waitForExpectationsTimeout error: \(error)")
//            }
//        }
//
//    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {[weak self] in
//            self?.testAPIResponse()
//        }
//    }
    
}
