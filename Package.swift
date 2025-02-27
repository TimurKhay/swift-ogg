// swift-tools-version:5.5.0
import PackageDescription

let package = Package(
    name: "SwiftOGG",
//    platforms: [
//        .iOS(.v10), .macOS(.v10_15), .ma
//    ],
    products: [
        .library(name: "SwiftOGG", targets: ["SwiftOGG"]),
    ],
    dependencies: [
        .package(
            name: "YbridOpus",
            url: "https://github.com/TimurKhay/opus-swift",
            .branch("master")),
        .package(
            name: "YbridOgg",
            url: "https://github.com/TimurKhay/ogg-swift.git",
            .branch("master"))
    ],
    targets: [
        // To debug with a local framework
//        .binaryTarget(name: "YbridOpus", path: "YbridOpus.xcframework"),
        .target(name: "Copustools", path: "Sources/SupportingFiles/Dependencies/Copustools"),
        .target(name: "SwiftOGG", dependencies: ["YbridOpus", "YbridOgg", "Copustools"], path: "Sources/SwiftOGG"),
        .testTarget(name: "EncoderDecoderTests", dependencies: ["SwiftOGG"], resources: [.process("Resources")]),
    ]
)
