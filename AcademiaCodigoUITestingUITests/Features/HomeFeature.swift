//
//  firstFeature.swift
//  AcademiaCodigoUITestingUITests
//
//  Created by jonathan Cuendet on 11/12/2019.
//  Copyright © 2019 jonathan Cuendet. All rights reserved.
//

import XCTest

class HomeFeature: UITestCase {
    override func setUp() {
        super.setUp()
        set(
            screens: [
                .app: AppScreen(uiTestCase: self)
            ],
        with: [
            AppSteps(stepTypes: [.given])
            ]
        )
    }

    func testValidateHomeScreen() {
        executeStep("Given I launch the app")
            // TODO
    }
}
