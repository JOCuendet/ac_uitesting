//
//  GallerySteps.swift
//  AcademiaCodigoUITestingUITests
//
//  Created by jonathan Cuendet on 11/12/2019.
//  Copyright © 2019 jonathan Cuendet. All rights reserved.
//

import Foundation
import XCTest

class GallerySteps: UIStepDefiner {
    override func createThenSteps() {

        createStep(withName: "I navigate to the gallery screen") {
            $0.homeScreen.openNavigationWith(option: .gallery)
        }

        createStep(withName: "I should see all of it's elements") {
            $0.galleryScreen.validateScreen()
        }
    }
}
