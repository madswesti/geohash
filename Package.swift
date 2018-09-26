// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Geohasher",
    targets: [
    .target(
        name: "Geohasher",
        dependencies: []),
    .testTarget(
        name: "GeohasherTests",
        dependencies: ["Geohasher"])
    ]
)
