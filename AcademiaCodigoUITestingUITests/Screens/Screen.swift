import Foundation
import XCTest

extension XCUIElement {
    var focus: Bool {
        return value(forKey: "hasKeyboardFocus") as? Bool ?? false
    }

    func clearText() {
        if let value = self.value as? String {
            typeText(value.map { _ in XCUIKeyboardKey.delete.rawValue }.joined(separator: ""))
        }
    }

    func clearAndEnter(text: String) {
        guard let value = self.value as? String, !value.isEmpty else {
            typeText(text)
            return
        }

        clearText()
        typeText(text)
    }

     func forceTap() {
        self.coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 0.0)).tap()
    }
}

extension String {
    var nsRange: NSRange {
        return NSRange(location: 0, length: utf16.count)
    }

    func match(regex: String) -> Bool {
        // swiftlint:disable:next force_try
        let regex = try! NSRegularExpression(pattern: regex, options: [])
        return !regex.matches(in: self,
                              options: [],
                              range: self.nsRange).isEmpty
    }
}

class Screen {
    let app: XCUIApplication
    private weak var uiTestCase: UITestCase?

    var elementScreen: XCUIElement

    var elementKeyboard: XCUIElement {
        return app.keyboards.firstMatch
    }


    private var elementAlertDescription: XCUIElement {
        return app.alerts.firstMatch.staticTexts.element(boundBy: 1)
    }

    func mirror() -> String {
        return app.debugDescription.replacingOccurrences(of: "\n", with: "-")
    }

    var elementCancelButton: XCUIElement {
        return app.navigationBars.buttons["Cancel"].firstMatch
    }

    let accIdentifierCloseIcon = "close icon"

    var elementCloseButton: XCUIElement {
        return app.navigationBars.buttons[accIdentifierCloseIcon].firstMatch
    }

    func floatingTextWithError(message: String, identifier: String) -> Bool {
        return app.cells.otherElements
            .containing(.textField, identifier: identifier).staticTexts.firstMatch.label == message
    }

    init(uiTestCase: UITestCase) {
        self.app = uiTestCase.app
        self.uiTestCase = uiTestCase
        elementScreen = app.windows.element(boundBy: 0)
    }

    var isSimulator: Bool {
        return TARGET_OS_SIMULATOR != 0
    }

    func manageSystemAlert(button: String) {
        uiTestCase?.addUIInterruptionMonitor(withDescription: "Touch ID for \"Waitrose\"") { alert -> Bool in
            alert.buttons[button].tap()
            return true
        }
        sleep(1) //🛠
        app.tap()
    }

    func scrollTo(element: XCUIElement) {
        var idx = 0
        while !visibility(of: element) && idx < 20 {
            swipe(inDirection: .up)
            idx += 1
        }
    }

    func visibility(of element: XCUIElement) -> Bool {
        return visibility(of: element, reference: app.windows.element(boundBy: 0))
    }

    func visibility(of element: XCUIElement, reference: XCUIElement) -> Bool {
        return visibility(of: element, rect: reference.frame)
    }

    func visibility(of element: XCUIElement, rect: CGRect) -> Bool {
        guard element.exists else { return false }
        let elementFrame = element.frame
        guard !elementFrame.isEmpty else { return false }
        return rect.contains(elementFrame)
    }

    func wait(
        for element: XCUIElement,
        property: String = "exists",
        state: Bool = true,
        timeout: Int = 5,
        file: StaticString = #file,
        line: UInt = #line
        )
    {
        wait(for: [element], property: property, state: state, timeout: timeout, file: file, line: line)
    }

    func wait(
        for elements: [XCUIElement],
        property: String = "exists",
        state: Bool = true,
        timeout: Int = 5,
        file: StaticString = #file,
        line: UInt = #line
        )
    {
        let predicate = NSPredicate(format: "\(property) == \(state.description)")

        guard let uiTestCase = uiTestCase else { fatalError("💥 UITestCase not defined") }
        let expectations = elements.map { uiTestCase.expectation(for: predicate, evaluatedWith: $0) }
        XCTAssertTrue(
            XCTWaiter().wait(for: expectations, timeout: TimeInterval(timeout)) == .completed,
            file: file,
            line: line
        )
    }

    func waitInProgress() {
        wait(for: app.activityIndicators["In progress"].firstMatch, state: false)
    }

    func waitAndTap(on element: XCUIElement) {
        wait(for: element)
        element.tap()
    }

    func currentPage() -> Bool {
        return elementScreen.exists
    }

    func waitForAlert() {
        wait(for: app.alerts.firstMatch)
    }

    enum AlertButtons: String {
        case changeSlot
        case ContinueShopping
        case visitWaitrose
        case proceedToWaitrose
        case `continue`
        case cancel
        case yes
        case OK

        var label: String {
            switch self {
            case .changeSlot:
                return "Change slot"
            case .ContinueShopping:
                return "Continue shopping"
            case .visitWaitrose:
                return "Visit waitrose.com"
            case .proceedToWaitrose:
                return "Proceed to waitrose.com"
            case .`continue`:
                return "Continue"
            case .cancel:
                return "Cancel"
            case .yes:
                return "Yes"
            case .OK:
                return "OK"
            }
        }
    }

    func alertTap(button: AlertButtons) {
        app.alerts.buttons[button.label].firstMatch.tap()
    }

    func isAlertWith(title: String) -> (Bool, String) {
        let alertTitle = app.alerts.firstMatch.label
        return (alertTitle == title, alertTitle)
    }

    func isAlertWith(description: String) -> (Bool, String ){
        let alertDesc = elementAlertDescription.label
        return (alertDesc.match(regex: description), alertDesc)
    }

    func alertWith(button: String) -> Bool {
        return app.alerts.buttons[button].firstMatch.exists
    }

    func alertVisibility() -> Bool {
        return visibility(of: app.alerts.firstMatch)
    }

    func await(file: StaticString = #file, line: UInt = #line) {
        wait(for: elementScreen, file: file, line: line)
    }

    func inProgressWaitForDismiss() {
        wait(for: app.activityIndicators.allElementsBoundByIndex, state: false)
    }

    func backgroundForeground(wait: Bool = false) {
        XCUIDevice.shared.press(XCUIDevice.Button.home)
        if wait { sleep(1) }
        app.activate()
    }

    enum SwipeDirection {
        case up
        case down
        case left
        case right
    }

    enum SwipeGestureType {
        case fromTop
        case back
        case backCancel
        case gentleUp
    }

    func swipe(inDirection: SwipeDirection) {
        swipe(inDirection: inDirection, element: app.windows.element(boundBy: 0))
    }

    func swipe(inDirection: SwipeDirection, element: XCUIElement) {
        switch inDirection {
        case .up:
            element.swipeUp()
        case .down:
            element.swipeDown()
        case .left:
            element.swipeLeft()
        case .right:
            element.swipeRight()
        }
    }

    func swipeGesture(type: SwipeGestureType) {
        let screen = app.windows.element(boundBy: 0)
        switch type {
        case .fromTop:
            let startCoordinate = screen.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0))
            let endCoordinate = screen.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.75))
            startCoordinate.press(forDuration: 0, thenDragTo: endCoordinate)
        case .back:
            let startCoordinate = screen.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0.5))
            let endCoordinate = screen.coordinate(withNormalizedOffset: CGVector(dx: 0.75, dy: 0.5))
            startCoordinate.press(forDuration: 0, thenDragTo: endCoordinate)
        case .backCancel:
            let startCoordinate = screen.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0.5))
            let endCoordinate = screen.coordinate(withNormalizedOffset: CGVector(dx: 0.3, dy: 0.5))
            startCoordinate.press(forDuration: 0, thenDragTo: endCoordinate)
        case .gentleUp:
            let startCoordinate = screen.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5))
            let endCoordinate = screen.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.25))
            startCoordinate.press(forDuration: 0, thenDragTo: endCoordinate)
        }
    }

    func dismissKeyboard() {
        if app.keys.element(boundBy: 0).exists {
            app.typeText("\n")
        }
    }

    func state(of element: XCUIElement) -> Bool {
        return element.isEnabled
    }
    func keyboardVisibility() -> Bool {
        return app.keyboards.firstMatch.exists && visibility(of: app.keyboards.firstMatch)
    }

    func close() {
        elementCloseButton.tap()
    }

    func screenshot(with name: String, element: XCUIElement) {
        let screenshot = element.screenshot()

        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.lifetime = .keepAlways
        attachment.name = name
        self.uiTestCase?.add(attachment)
    }

    func screenshot(with name: String) {
        screenshot(with: name, element: app.windows.firstMatch)
    }
}

protocol ScreenValidator {
    func validate()
}
