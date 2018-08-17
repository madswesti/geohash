import XCTest
@testable import Geohash

class BoundingBoxTests: XCTestCase {
    
    var subject: BoundingBox<SampleLocation>!
    
    override func setUp() {
        super.setUp()
        do {
            self.subject = try BoundingBox<SampleLocation>(
                min: SampleLocation(longitude: -10, latitude: -10),
                max: SampleLocation(longitude: +10, latitude: +10))
        } catch {
            XCTFail("Failed to setup test")
        }
    }
    
    func testIntersectsIntersecting() throws {
        let intersecting = try BoundingBox<SampleLocation>(
            min: SampleLocation(longitude: -20, latitude: -20),
            max: SampleLocation(longitude: -9, latitude: -9)
        )
        XCTAssertTrue(subject.intersects(intersecting))
    }
    
    func testIntersectsNonIntersecting() throws {
        let intersecting = try BoundingBox<SampleLocation>(
            min: SampleLocation(longitude: -20, latitude: -20),
            max: SampleLocation(longitude: -9, latitude: -10.1)
        )
        XCTAssertFalse(subject.intersects(intersecting))
    }
}

extension BoundingBoxTests {
    static var allTests = [
        ("testIntersectsIntersecting", testIntersectsIntersecting),
        ("testIntersectsNonIntersecting", testIntersectsNonIntersecting)
    ]
}
