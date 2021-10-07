// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "matlab-swift",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MatLabSwift",
            targets: ["MatLabSwift"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MatLabSwift",
            dependencies: [],
            path: "Sources"),
        .testTarget(
            name: "MatLabSwiftTests",
            dependencies: ["MatLabSwift"],
            path: "Tests"),
    ]
)
