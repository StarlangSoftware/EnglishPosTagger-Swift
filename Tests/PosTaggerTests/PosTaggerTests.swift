import XCTest
@testable import PosTagger

final class PosTaggerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(PosTagger().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
