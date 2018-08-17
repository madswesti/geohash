// swiftlint:disable identifier_name

import Foundation

public protocol Location {
    var longitude: Double { get }
    var latitude: Double { get }

    init(longitude: Double, latitude: Double)
    func distanceInMeters(to: Location) -> Double
}

public extension Location {
    func distanceInMeters(to: Location) -> Double {
        let aLat = Double(Constants.radiansPerDegree * latitude)
        let bLat = Double(Constants.radiansPerDegree * to.latitude)
        let deltaLat =  bLat - aLat
        let deltaLon = Double(Constants.radiansPerDegree * (to.longitude - longitude))

        let sinHalfLat = sin(Double(0.5) * deltaLat)
        let sinHalfLon = sin(Double(0.5) * deltaLon)

        let x = sinHalfLat * sinHalfLat + sinHalfLon * sinHalfLon * cos(aLat) * cos(bLat)
        let arc = asin(sqrt(x)) // only good for smallish angles, otherwise user atan2

        return Constants.earthDiameterMeters * Double(arc)
    }
}

fileprivate enum Constants {
    static let radiansPerDegree = .pi / 180.0
    static let earthDiameterMeters = 2.0 * 6_371_000.0
}
