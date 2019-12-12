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

    // Add more elements to the testing scope

    // Field type not correct - use debug tool to confirm correct element type.
    private var elementTextArea: XCUIElement {
        return app.textFields["secondScreen_textArea"].firstMatch
    }

    func testElements() {

        // the test must navigate to the other tab to be able to test this!

        
        //FIXME: fix this
        XCTAssertFalse(elementTextArea.exists)

        //TODO: create a new element and a Bool func
        //        XCTAssertTrue(validateTabBar())
        
    }
}
