//
//  GalleryScreenSteps.swift
//  AcademiaCodigoUITestingUITests
//
//  Created by jonathan Cuendet on 12/12/2019.
//  Copyright © 2019 jonathan Cuendet. All rights reserved.
//

import Foundation
import XCTest

class MoreScreenSteps: UIStepDefiner {

    override func createThenSteps() {

        createStep(withName: "I navigate to the gallery screen") {
            $0.homeScreen.openNavigationWith(option: .more)
            $0.moreScreen.await()
            $0.moreScreen.validate()
            $0.moreScreen.openGallery()
        }

        createStep(withName: "I should see all of it's elements") {
            $0.moreScreen.validate()
        }
    }
}
