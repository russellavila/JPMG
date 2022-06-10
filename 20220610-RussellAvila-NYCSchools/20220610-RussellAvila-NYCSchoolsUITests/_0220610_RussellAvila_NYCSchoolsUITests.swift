//
//  _0220610_RussellAvila_NYCSchoolsUITests.swift
//  20220610-RussellAvila-NYCSchoolsUITests
//
//  Created by Consultant on 6/9/22.
//

import XCTest

class _0220610_RussellAvila_NYCSchoolsUITests: XCTestCase {
    
    var app: XCUIApplication?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //launch application for some simple tests
        try super.setUpWithError()
        self.app = XCUIApplication()
        self.app?.launch()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //assure main title screens launches with title "School Names"
    func testLoadsMainScreen() {
        // Arrange
        
        // Act
        let titleElement = self.app?.staticTexts["School Names"]

        // Assert
        XCTAssertEqual(titleElement?.exists, true)
    }
    
    //though not good practice to test something which requires a live network connection,
    //for sake of practicality this test assures that at least the second cell in the table view has data, and that the network manager is fetching from json.
    func testScrollToTwentyiethCell() {
        
        let tablesQuery = XCUIApplication().tables
        tablesQuery.staticTexts["Section: 0, row: 0"].swipeUp()
        tablesQuery.staticTexts["Section: 0, row: 4"].swipeUp()
        let secondCellLabel = tablesQuery.staticTexts["Section: 0, row: 2"]
        
        XCTAssertEqual(secondCellLabel.exists, true)
    }
    
    
    /*
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
     */
}
