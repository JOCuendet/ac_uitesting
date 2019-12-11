//
//  GalleryFeature.swift
//  AcademiaCodigoUITestingUITests
//
//  Created by jonathan Cuendet on 11/12/2019.
//  Copyright © 2019 jonathan Cuendet. All rights reserved.
//

import Foundation
class GalleryFeature: UITestCase {
    override func setUp() {
        super.setUp()
        set(
            screens: [
                .app: AppScreen(uiTestCase: self),
                .home: HomeScreen(uiTestCase: self),
                .gallery: GalleryScreen(uiTestCase: self)
            ],
            with: [
                AppSteps(stepTypes: [.given]),
                HomeSteps(stepTypes: [.when, .then]),
                GallerySteps(stepTypes: [.when, .then])
            ]
        )
    }

    func testValidateGalleryScreenElements() {
        executeStep("Given I launch the app")
        executeStep("And I navigate to the gallery screen")
        executeStep("Then I should see all of it's elements")

    }
}
