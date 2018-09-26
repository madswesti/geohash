import XCTest
@testable import GeohasherTests

XCTMain([
  testCase(BoundingBoxTests.allTests),
  testCase(GeohashTests.allTests),
  testCase(GeohashIteratorTests.allTests),
  testCase(LocationTests.allTests)
])
