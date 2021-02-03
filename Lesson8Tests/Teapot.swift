//
//  Teapot.swift
//  Lesson8Tests
//
//  Created by Ksusha on 02.02.2021.
//

import XCTest
@testable import Lesson8

class TeapotTest: XCTestCase {
    
    var teapot: Teapot!
    
    //let teapot = Teapot()
    
    override func setUp() {
        super.setUp()
        teapot = Teapot()
    }
    
    override func tearDown() {
        teapot = nil
        super.tearDown()
    }

//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//
//        // In UI tests it is usually best to stop immediately when a failure occurs.
//        continueAfterFailure = false
//
//        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
//        XCUIApplication().launch()
//
//        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }

//    func testExample() throws {
//        // Use recording to get started writing UI tests.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
    
    //попытка закрыть уже закрытый чайник
    func testCloseIfItClosed() {
        teapot.isOpen = false
        var error: TeapotError?
        let expectedResult = TeapotError.lidAlreadyClosed
        
        XCTAssertThrowsError(try teapot.close()) { thrownError in
            error = thrownError as? TeapotError
        }
        
        XCTAssertEqual(error, expectedResult)
    }
    
    //попытка открыть уже открытый чайник
    func testOpenIfItOpen() {
        teapot.isOpen = true
        var error: TeapotError?
        let expectedResult = TeapotError.lidAlreadyOpen
        
        XCTAssertThrowsError(try teapot.open()) { thrownError in
            error = thrownError as? TeapotError
        }
        
        XCTAssertEqual(error, expectedResult)
    }

}


class CupTest: XCTestCase {
    
    var cup: Cup!
    
    override func setUp() {
        super.setUp()
        cup = Cup()
    }
    
    override func tearDown() {
        cup = nil
        super.tearDown()
    }
    
    //попытка помыть чистую чашку
    func testWashCupIfItClean() {
        cup.isClean = true
        var error: CupError?
        let expectedResult = CupError.dirtyCup
        
        XCTAssertThrowsError(try cup.wash()) { thrownError in
            error = thrownError as? CupError
        }
        
        XCTAssertEqual(error, expectedResult)
    }

}
