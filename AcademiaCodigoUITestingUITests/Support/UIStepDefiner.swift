import Foundation
import XCTest

typealias StepClosure = (ScreenMap) -> Void
typealias UITestCaseGherkinSteps = [String: StepClosure]

enum GherkinStepType {
    case given
    case when
    case then
}

class UIStepDefiner {

    private(set) var uiTestCaseGherkinSteps = UITestCaseGherkinSteps()

    func createGivenSteps() {
    }

    func createWhenSteps() {
    }

    func createThenSteps() {
    }

    init(stepTypes: [GherkinStepType]) {
        if stepTypes.contains(.given) {
            createGivenSteps()
        }

        if stepTypes.contains(.when) {
            createWhenSteps()
        }

        if stepTypes.contains(.then) {
            createThenSteps()
        }
    }

    init() {
        createGivenSteps()
        createWhenSteps()
        createThenSteps()
    }

    func createStep(withName name: String, _ body: @escaping StepClosure ) {
        assert(uiTestCaseGherkinSteps[name] == nil, "💥 Already have a test with name \'\(name)\'")
        uiTestCaseGherkinSteps[name] = body
    }
}
