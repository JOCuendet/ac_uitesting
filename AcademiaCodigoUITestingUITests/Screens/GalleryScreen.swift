//
//  SecondScreenUITests.swift
//  AcademiaCodigoUITestingUITests
//
//  Created by jonathan Cuendet on 11/12/2019.
//  Copyright © 2019 jonathan Cuendet. All rights reserved.
//

import XCTest

class GalleryScreen: Screen, TabBar {

    private var elementACLogo: XCUIElement {
        return app.images["AC_LOGO_FULL"].firstMatch
    }
    
    private var elementTitleLabel: XCUIElement {
        return app.staticTexts["secondScreen_title_label"].firstMatch
    }
    
    private var elementSubTitleLabel: XCUIElement {
        return app.staticTexts["secondScreen_subTitle_label"].firstMatch
    }

    private var elementTextArea: XCUIElement {
        return app.textViews["secondScreen_textArea"].firstMatch
    }
    
    private var elementMainTabBar: XCUIElement {
        return app.tabBars.firstMatch
    }
    
    func validateScreen() {
        XCTAssertTrue(elementTitleLabel.exists)
        XCTAssertTrue(elementSubTitleLabel.exists)
        XCTAssertTrue(elementACLogo.exists)
        XCTAssertTrue(elementTextArea.exists)
    }
}
