//
//  SecondScreenUITests.swift
//  AcademiaCodigoUITestingUITests
//
//  Created by jonathan Cuendet on 11/12/2019.
//  Copyright © 2019 jonathan Cuendet. All rights reserved.
//

import XCTest

class GalleryScreen: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        app.launch()
    }
    
    private var elementACLogo: XCUIElement {
        return app.images["AC_LOGO_FULL"].firstMatch
    }
    
    private var elementTitleLabel: XCUIElement {
        return app.staticTexts["secondScreen_title_label"].firstMatch
    }
    
    private var elementSubTitleLabel: XCUIElement {
        return app.staticTexts["secondScreen_subTitle_label"].firstMatch
    }
    
    // Field type not correct - use debug tool to confirm correct element type.
    private var elementTextArea: XCUIElement {
        return app.textFields["secondScreen_textArea"].firstMatch
    }
    
    private var elementMainTabBar: XCUIElement {
        return app.tabBars.firstMatch
    }
    
    func testElements() {

        // the test must navigate to the other tab to be able to test this!
        
        XCTAssertTrue(elementTitleLabel.exists)
        XCTAssertTrue(elementSubTitleLabel.exists)
        XCTAssertTrue(elementACLogo.exists)
        
        //FIXME: fix this
        XCTAssertTrue(elementTextArea.exists)
        
        XCTAssertTrue(elementMainTabBar.exists)
        
        //TODO: create a new Bool func
        //        XCTAssertTrue(validateTabBar())
        
    }
}
