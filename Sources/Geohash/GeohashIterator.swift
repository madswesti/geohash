public class GeohashIterator<L: Location>: IteratorProtocol, Sequence {
    
    let bounds: BoundingBox<L>
    var latBaseline: Geohash<L>
    var current: Geohash<L>?
    
    public init(bounds: BoundingBox<L>, bitPrecision: UInt8) throws {
        self.bounds = bounds
        self.latBaseline = try Geohash(location: bounds.min, bitPrecision: bitPrecision)
        self.current = self.latBaseline
    }
    
    public func next() -> Geohash<L>? {
        defer { advanceCurrent() }
        return current
    }
    
    private func advanceCurrent() {
        // advance eastward until we are out of the bounds then advance northward
        if var bits = self.current {
            bits = bits.neighbor(.east)
            if bounds.intersects(bits.boundingBox()) {
                current = bits
            } else {
                latBaseline = latBaseline.neighbor(.north)
                current = bounds.intersects(latBaseline.boundingBox()) ? latBaseline : nil
            }
        }
    }
}
