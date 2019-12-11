import Foundation
import XCTest

class UITestCase: XCTestCase {
    let app = XCUIApplication()

    private var uiTestCaseGherkinSteps = UITestCaseGherkinSteps()
    private static var firstUse: Bool = true
    private var screens: ScreenMap!

    static func isFirstUse() -> Bool {
        let fu = UITestCase.firstUse
        UITestCase.firstUse = false
        return fu
    }

    private var regex: NSRegularExpression {
        do {
            return try NSRegularExpression(
                pattern: "(?<=(given|when|then|and)\\s).*",
                options: [.caseInsensitive]
            )
        } catch {
            fatalError("💥 error executing \'\(name)\'")
        }
    }

    func set(screens: ScreenMap, with steps: [UIStepDefiner]) {
        self.screens = screens
        merge(steps: steps)
    }

    // swiftlint:disable identifier_name
    func executeStep(_ name: String) {
        XCTContext.runActivity(named: name) {
            if let match =  regex.firstMatch(in: $0.name, options: .reportProgress, range: $0.name.nsRange) {
                if let range = Range(match.range, in: $0.name) {
                    executeStep(withName: String($0.name[range]), screens: screens)
                }
            } else {
                fatalError("💥 Step not found \'\(name)\'")
            }
        }
    }


    override func setUp() {
        super.setUp()
        if let testName = self.name.components(separatedBy: .whitespaces).last?.dropLast() {
            log(message: "test: \(testName)")
        }
    }

    override func tearDown() {
        super.tearDown()
        screens = nil
    }

    // MARK: private
    private func merge(steps: [UIStepDefiner]) {
        for composer in steps {
            //merge the steps
            for step in composer.uiTestCaseGherkinSteps {
                assert(uiTestCaseGherkinSteps[step.key] == nil, "💥 Already have a test with name \'\(step.key)\'")
                self.uiTestCaseGherkinSteps[step.key] = step.value
            }
        }
    }

    private func executeStep(withName name: String, screens: ScreenMap) {
        log(message: name)
        guard let gherkinStep = uiTestCaseGherkinSteps[name] else {
            fatalError("💥 Step \'\(name)\' not found")
        }

        //execute Gherkin step
        gherkinStep(screens)
    }

    private func log(message: String) {
        FileHandle.standardOutput.write(Data(">>> 📝 EXECUTESTEP: \(message)\n".utf8))
    }
}
