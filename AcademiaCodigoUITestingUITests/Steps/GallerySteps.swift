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
        createStep(withName: "I should see the gallery screen") {
            $0.galleryScreen.await()
            $0.galleryScreen.validate()
        }
    }
    
}
