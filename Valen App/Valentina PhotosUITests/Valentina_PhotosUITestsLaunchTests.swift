//
//  Valentina_PhotosUITestsLaunchTests.swift
//  Valentina PhotosUITests
//
//  Created by Omar Leal on 1/6/22.
//

import XCTest

class Valentina_PhotosUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()



        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
