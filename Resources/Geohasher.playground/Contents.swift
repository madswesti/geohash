//: Playground - noun: a place where people can play

import UIKit
import Geohasher

struct SampleLocation: Location {
    let longitude: Double
    let latitude: Double

    init(longitude lon: Double, latitude lat: Double) {
        self.longitude = lon
        self.latitude = lat
    }
}

let min = SampleLocation(longitude: -85.58501, latitude: 31.07828)
let max = SampleLocation(longitude: -78.98223, latitude: 37.811469)
let bounds = try BoundingBox<SampleLocation>(min: min, max: max)
let iterator = try GeohashIterator(bounds: bounds, characterPrecision: 3)

for hash in iterator {
    print(hash.hash())
}
