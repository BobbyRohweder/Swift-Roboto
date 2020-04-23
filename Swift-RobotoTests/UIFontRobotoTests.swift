//
//  UIFontRobotoTests.swift
//  Swift-RobotoTests
//
//  Created by Bobby Rohweder on 4/23/20.
//  Copyright © 2020 Bobby Rohweder. All rights reserved.
//

import SwiftRoboto
import UIKit
import XCTest

class UIFontRobotoTests: XCTestCase {
    
    func testRobotoFont() {
        XCTAssertNotNil(UIFont.roboto(size: 25))
        XCTAssertNotNil(UIFont.roboto(size: 5000))
        
        XCTAssertNotNil(UIFont.roboto(size: 50, weight: .thin))
        XCTAssertNotNil(UIFont.roboto(size: 50, weight: .ultraLight))
        XCTAssertNotNil(UIFont.roboto(size: 50, weight: .light))
        XCTAssertNotNil(UIFont.roboto(size: 50, weight: .regular))
        XCTAssertNotNil(UIFont.roboto(size: 50, weight: .medium))
        XCTAssertNotNil(UIFont.roboto(size: 50, weight: .semibold))
        XCTAssertNotNil(UIFont.roboto(size: 50, weight: .bold))
        XCTAssertNotNil(UIFont.roboto(size: 50, weight: .heavy))
    }
    
    func testItalicRobotoFont() {
        XCTAssertNotNil(UIFont.robotoItalic(size: 25))
        XCTAssertNotNil(UIFont.robotoItalic(size: 5000))
        
        XCTAssertNotNil(UIFont.robotoItalic(size: 50, weight: .thin))
        XCTAssertNotNil(UIFont.robotoItalic(size: 50, weight: .ultraLight))
        XCTAssertNotNil(UIFont.robotoItalic(size: 50, weight: .light))
        XCTAssertNotNil(UIFont.robotoItalic(size: 50, weight: .regular))
        XCTAssertNotNil(UIFont.robotoItalic(size: 50, weight: .medium))
        XCTAssertNotNil(UIFont.robotoItalic(size: 50, weight: .semibold))
        XCTAssertNotNil(UIFont.robotoItalic(size: 50, weight: .bold))
        XCTAssertNotNil(UIFont.robotoItalic(size: 50, weight: .heavy))
    }
    
}
