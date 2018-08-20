import XCTest

@testable import Geohasher

class GeohashIteratorTests: XCTestCase {
    
    var bounds: BoundingBox<SampleLocation>!
    
    override func setUp() {
        super.setUp()

        do {
            self.bounds = try BoundingBox<SampleLocation>(
                min: SampleLocation(longitude: 0.09991, latitude: 51.49996),
                max: SampleLocation(longitude: 0.10059, latitude: 51.50028))
        } catch {
            XCTFail("Failed to setup test")
        }
    }
    
    
    func testIterateLevel8() throws {
        let subject = try GeohashIterator(bounds: bounds, bitPrecision: 20)
        XCTAssertEqual(subject.next()?.hash(), "u10hfr2c")
        XCTAssertEqual(subject.next()?.hash(), "u10hfr31")
        XCTAssertEqual(subject.next()?.hash(), "u10hfr2f")
        XCTAssertEqual(subject.next()?.hash(), "u10hfr34")
        XCTAssertNil(subject.next())
    }

    func testIterateCharacterPercision() throws {
        let min = SampleLocation(longitude: -111.04764916561925, latitude: 45.673109486297705)
        let max = SampleLocation(longitude: -111.04239979740194, latitude: 45.681051369346676)
        let bounds = try BoundingBox<SampleLocation>(min: min, max: max)
        let iterator = try GeohashIterator(bounds: bounds, characterPrecision: 3)
        iterator.forEach {
            XCTAssertEqual($0.hash().count, 3)
        }
    }

    func testBoundingBoxHashCollection() throws {
        let min = SampleLocation(longitude: -85.58501, latitude: 31.07828)
        let max = SampleLocation(longitude: -78.98223, latitude: 37.811469)
        let bounds = try BoundingBox<SampleLocation>(min: min, max: max)
        let iterator = try GeohashIterator(bounds: bounds, characterPrecision: 3)

        var hashSet = Set<String>()
        iterator.forEach { hashSet.insert($0.hash()) }
        XCTAssertEqual(hashSet.count, 25)
    }
}

extension GeohashIteratorTests {
    static var allTests = [
        ("testIterateLevel8", testIterateLevel8),
        ("testIterateCharacterPercision", testIterateCharacterPercision),
        ("testBoundingBoxHashCollection", testBoundingBoxHashCollection)
    ]
}
