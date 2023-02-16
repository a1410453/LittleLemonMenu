//
//  LittleLemonMenuTests.swift
//  LittleLemonMenuTests
//
//  Created by Rustem Orazbayev on 12.02.2023.
//

import XCTest
@testable import LittleLemonMenu

final class LittleLemonMenuTests: XCTestCase {
    func test_menuItem_IfTitleIsEqualToInitOne() {
        let menu = MenuViewModel()
        let items = menu.items
        let menuItemsCount = items.count
        XCTAssertEqual(24, menuItemsCount)
    }
}
