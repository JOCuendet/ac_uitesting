//
//  GalleryScreen.swift
//  AcademiaCodigoUITestingUITests
//
//  Created by jonathan Cuendet on 12/12/2019.
//  Copyright © 2019 jonathan Cuendet. All rights reserved.
//

import Foundation
import XCTest

class GalleryScreen: Screen, TabBar {

    private var elementPAODOCKLabel: XCUIElement {
        return app.staticTexts[Accessibility.paodock.identifier].firstMatch
    }

    private var elementCollectionView: XCUIElement {
        return app.collectionViews[Accessibility.galleryCollectionView.identifier].firstMatch
    }
    func validate() {
        XCTAssertTrue(elementPAODOCKLabel.exists)
        XCTAssertTrue(elementCollectionView.exists)
    }
}
