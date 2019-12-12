//
//  FirstScreenUITests.swift
//  AcademiaCodigoUITestingUITests
//
//  Created by jonathan Cuendet on 11/12/2019.
//  Copyright © 2019 jonathan Cuendet. All rights reserved.
//

import XCTest

class HomeScreen: Screen, TabBar {

    private var elementACLogo: XCUIElement {
        return app.images[Accessibility.acBanner.identifier].firstMatch
    }

    private var elementTextArea: XCUIElement {
        return app.textViews[Accessibility.introTextArea.identifier].firstMatch
    }

    private var elementMainTabBar: XCUIElement {
        return app.tabBars.firstMatch
    }

    func validate() {
        XCTAssertTrue(elementACLogo.exists)
        XCTAssertTrue(elementTextArea.exists)
        XCTAssertTrue(elementMainTabBar.exists)
    }
}
