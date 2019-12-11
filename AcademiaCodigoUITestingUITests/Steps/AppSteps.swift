//
//  AppSteps.swift
//  PaodockUITests
//
//  Created by jonathan Cuendet on 07/12/2019.
//  Copyright © 2019 jonathan Cuendet. All rights reserved.
//

import Foundation
import XCTest

class AppSteps: UIStepDefiner {

    func start(app: AppScreen) {
        app.launch()
    }

    override func createGivenSteps() {

        createStep(withName: "I launch the app") {
            self.start(app: $0.appScreen)
            $0.homeScreen.validate()
        }
    }
}
