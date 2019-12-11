import Foundation
import XCTest

class AppScreen: Screen {

    func launch(_ arguments: [String]? = nil) {
        arguments?.forEach { app.launchArguments.append($0) }
        app.launch()
    }

    func waitForPaodockApp() {
        wait(for: app)
    }
}
