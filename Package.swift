// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "servo",
    products: [
        .library(name: "servo", targets: ["App"]),
    ],
    dependencies: [
        .package(url: "https://github.com/uraimo/SwiftyGPIO.git", from: "1.0.0"),
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
        .package(url: "https://github.com/vapor/fluent-sqlite.git", from: "3.0.0"),
    ],
    targets: [
        .target(name: "App", dependencies: ["FluentSQLite", "SwiftyGPIO", "Vapor"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)

