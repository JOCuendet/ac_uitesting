//
//  TabBar.swift
//  PaodockUITests
//
//  Created by jonathan Cuendet on 07/12/2019.
//  Copyright © 2019 jonathan Cuendet. All rights reserved.
//
import Foundation
import XCTest

enum TabBarOptions: String {
    case home
    case more

    var accessibilityLabel: String {
        switch self {
        case .home:
            return "Home"
        case .more:
            return "More"
        }
    }
}

protocol TabBar {
    func openNavigationWith(option: TabBarOptions)
    func tabBarButtonStateWith(option: TabBarOptions) -> Bool
}

extension TabBar where Self: Screen {
    func openNavigationWith(option: TabBarOptions) {
        let elementTabBar = app.tabBars.buttons[option.accessibilityLabel].firstMatch
        wait(for: elementTabBar)
        elementTabBar.tap()
        waitInProgress()
    }

    func tabBarButtonStateWith(option: TabBarOptions) -> Bool {
        return app.tabBars.buttons[option.accessibilityLabel].isSelected
    }
}
