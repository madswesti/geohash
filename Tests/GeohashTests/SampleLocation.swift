import Geohash

struct SampleLocation: Location {
    let longitude: Double
    let latitude: Double

    init(longitude lon: Double, latitude lat: Double) {
        self.longitude = lon
        self.latitude = lat
    }
}
