//
//  SecondScreenUITests.swift
//  AcademiaCodigoUITestingUITests
//
//  Created by jonathan Cuendet on 11/12/2019.
//  Copyright © 2019 jonathan Cuendet. All rights reserved.
//

import XCTest

class MoreScreen: Screen, TabBar {

    private var elementACLogo: XCUIElement {
        return app.images[Accessibility.acLogo.identifier].firstMatch
    }

    private var elementNextScreenButton: XCUIElement {
        return app.buttons[Accessibility.galleryAccessButton.identifier].firstMatch
    }

    func validate() {
        XCTAssertTrue(elementACLogo.exists)
        XCTAssertTrue(elementNextScreenButton.exists)
    }

    func openGallery() {
        elementNextScreenButton.tap()
    }

}
