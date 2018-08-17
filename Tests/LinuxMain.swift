import XCTest
@testable import GeohashTests

XCTMain([
  testCase(BoundingBoxTests.allTests),
  testCase(GeohashTests.allTests),
  testCase(GeohashIteratorTests.allTests),
  testCase(LocationTests.allTests)
])
