//
//  UIKitTest.swift
//  
//
//  Created by npc on 2023/11/27.
//

import UIKit
import XCTest
@testable import EasyLINESeed

final class UIKitTest: XCTestCase {

    override func setUp() {
        print(LINEType.extraBold)
        print(LINEType.bold)
        print(LINEType.regular)
        print(LINEType.thin)
    }

    func testLargeTitle() throws {
        let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: UIFont.TextStyle.largeTitle)
        let comparisonFont = UIFont(name: "LINESeedJPApp_OTF-ExtraBold", size: descriptor.pointSize)
        XCTAssertEqual(comparisonFont, UIFont.LINESeed.largeTitle)
    }

    func testTitle() throws {
        let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: UIFont.TextStyle.title1)
        let comparisonFont = UIFont(name: "LINESeedJPApp_OTF-Bold", size: descriptor.pointSize)!
        XCTAssertEqual(comparisonFont, UIFont.LINESeed.title)
    }

    func testSubTitle() throws {
        let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: UIFont.TextStyle.title2)
        let comparisonFont = UIFont(name: "LINESeedJPApp_OTF-Bold", size: descriptor.pointSize)!
        XCTAssertEqual(comparisonFont, UIFont.LINESeed.subTitle)
    }

    func testBody() throws {
        let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: UIFont.TextStyle.body)
        let comparisonFont = UIFont(name: "LINESeedJPApp_OTF-Regular", size: descriptor.pointSize)!
        XCTAssertEqual(comparisonFont, UIFont.LINESeed.body)
    }

    func testFootnote() throws {
        let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: UIFont.TextStyle.footnote)
        let comparisonFont = UIFont(name: "LINESeedJPApp_OTF-Thin", size: descriptor.pointSize)!
        XCTAssertEqual(comparisonFont, UIFont.LINESeed.footnote)
    }


}
