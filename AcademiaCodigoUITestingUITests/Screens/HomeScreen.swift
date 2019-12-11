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
        return app.images["AC_LOGO_FULL"].firstMatch
    }

    func validate() {
        XCTAssertTrue(elementACLogo.exists)
    }
}
