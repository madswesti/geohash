// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "Geohasher",
	products: [
		   .library(name: "Geohasher", targets: ["Geohasher"])
	   ],
    targets: [
    .target(
        name: "Geohasher",
        dependencies: []),
    .testTarget(
        name: "GeohasherTests",
        dependencies: ["Geohasher"])
    ]
)
