// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PosTagger",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "PosTagger",
            targets: ["PosTagger"]),
    ],
    dependencies: [
        .package(name: "Corpus", url: "https://github.com/StarlangSoftware/Corpus-Swift.git", .exact("1.0.17")),
        .package(name: "Hmm", url: "https://github.com/StarlangSoftware/Hmm-Swift.git", .exact("1.0.1")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "PosTagger",
            dependencies: ["Corpus", "Hmm"],
            resources: [.process("brown.txt")]),
        .testTarget(
            name: "PosTaggerTests",
            dependencies: ["PosTagger"]),
    ]
)
