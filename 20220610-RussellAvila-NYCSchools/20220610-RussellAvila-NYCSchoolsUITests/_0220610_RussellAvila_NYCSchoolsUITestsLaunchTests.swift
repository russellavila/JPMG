//
//  _0220610_RussellAvila_NYCSchoolsUITestsLaunchTests.swift
//  20220610-RussellAvila-NYCSchoolsUITests
//
//  Created by Consultant on 6/9/22.
//

import XCTest

class _0220610_RussellAvila_NYCSchoolsUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    /*func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }*/
}