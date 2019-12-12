//
//  GalleryFeature.swift
//  AcademiaCodigoUITestingUITests
//
//  Created by jonathan Cuendet on 11/12/2019.
//  Copyright © 2019 jonathan Cuendet. All rights reserved.
//

import Foundation
class MoreFeature: UITestCase {
    override func setUp() {
        super.setUp()
        set(
            screens: [
                .app: AppScreen(uiTestCase: self),
                .home: HomeScreen(uiTestCase: self),
                .gallery: GalleryScreen(uiTestCase: self),
                .more: MoreScreen(uiTestCase: self)
            ],
            with: [
                AppSteps(stepTypes: [.given]),
                HomeSteps(stepTypes: [.when, .then]),
                MoreScreenSteps(stepTypes: [.when, .then]),
                GallerySteps(stepTypes: [.when, .then])
            ]
        )
    }

    func testValidateMoreScreen() {
        executeStep("Given I launch the app")
            // TODO
    }
}
