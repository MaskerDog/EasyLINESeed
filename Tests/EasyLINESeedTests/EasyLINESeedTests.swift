import SwiftUI
import XCTest
@testable import EasyLINESeed

final class EasyLINESeedTests: XCTestCase {
    // Fixed Boldのテスト
    func testFixedBold() throws {
        let comparisonFont = Font.custom("LINE Seed JP App_OTF", fixedSize: 20).weight(.bold)
        XCTAssertEqual(comparisonFont, Font.LINESeed.fixed(.bold, size: 20))
    }
    // Fixed extraBoldのテスト
    func testFixedExtraBold() throws {
        let comparisonFont = Font.custom("LINE Seed JP App_OTF", fixedSize: 20).weight(.black)
        XCTAssertEqual(comparisonFont, Font.LINESeed.fixed(.extraBold, size: 20))
    }
    // Fixed regularのテスト
    func testFixedRegular() throws {
        let comparisonFont = Font.custom("LINE Seed JP App_OTF", fixedSize: 20).weight(.regular)
        XCTAssertEqual(comparisonFont, Font.LINESeed.fixed(.regular, size: 20))
    }
    // Fixed Thinのテスト
    func testFixedThin() throws {
        let comparisonFont = Font.custom("LINE Seed JP App_OTF", fixedSize: 20).weight(.thin)
        XCTAssertEqual(comparisonFont, Font.LINESeed.fixed(.thin, size: 20))
    }
    // Relative Boldのテスト
    func testRelativeBold() throws {
        let comparisonFont = Font.custom("LINE Seed JP App_OTF", size: 20, relativeTo: .body).weight(.bold)
        let target = Font.LINESeed.relative(.bold, size: 20, relativeTo: .body)
        XCTAssertEqual(comparisonFont, target)
    }
    // Relative extraBoldのテスト
    func testRelativeExtraBold() throws {
        let comparisonFont = Font.custom("LINE Seed JP App_OTF", size: 20, relativeTo: .body).weight(.black)
        let target = Font.LINESeed.relative(.extraBold, size: 20, relativeTo: .body)
        XCTAssertEqual(comparisonFont, target)
    }
    // Relative regularのテスト
    func testRelativeRegular() throws {
        let comparisonFont = Font.custom("LINE Seed JP App_OTF", size: 20, relativeTo: .body).weight(.regular)
        let target = Font.LINESeed.relative(.regular, size: 20, relativeTo: .body)
        XCTAssertEqual(comparisonFont, target)
    }
    // Relative Thinのテスト
    func testRelativeThin() throws {
        let comparisonFont = Font.custom("LINE Seed JP App_OTF", size: 20, relativeTo: .body).weight(.thin)
        let target = Font.LINESeed.relative(.thin, size: 20, relativeTo: .body)
        XCTAssertEqual(comparisonFont, target)
    }
}
