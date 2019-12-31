import XCTest
@testable import VideoFinder

final class VideoFinderTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(VideoFinder().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
