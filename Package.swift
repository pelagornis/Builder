// swift-tools-version: 5.9
import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "Builder",
    platforms: [.iOS(.v11), .macOS(.v10_15), .tvOS(.v11), .watchOS(.v4), .macCatalyst(.v13)],
    products: [
        .library(
            name: "Builder",
            targets: ["Builder"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.0-swift-5.9-DEVELOPMENT-SNAPSHOT-2023-04-25-b"),
        .package(url: "https://github.com/apple/swift-docc-plugin.git", from: "1.2.0")
    ],
    targets: [
        .macro(
            name: "BuilderMacroPlugin",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
        .target(
            name: "Builder",
            dependencies: [
                "BuilderMacroPlugin"
            ]),
        .testTarget(
            name: "BuilderTests",
            dependencies: ["Builder"]),
    ]
)
