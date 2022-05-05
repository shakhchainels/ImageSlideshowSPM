// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ImageSlideshowSPM",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ImageSlideshow",
            targets: ["ImageSlideshow"]),
        .library(
            name: "ImageSlideshow/Kingfisher",
            targets: ["ImageSlideshowKingfisher"])
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "7.2.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ImageSlideshow",
            dependencies: ["Kingfisher"],
            sources: [
                "Classes/Core/ActivityIndicator.swift",
                "Classes/Core/Bundle+Module.swift",
                "Classes/Core/FullScreenSlideshowViewController.swift",
                "Classes/Core/ImageSlideshow.swift",
                "Classes/Core/ImageSlideshowItem.swift",
                "Classes/Core/InputSource.swift",
                "Classes/Core/PageIndicator.swift",
                "Classes/Core/PageIndicatorPosition.swift",
                "Classes/Core/SwiftSupport.swift",
                "Classes/Core/UIImage+AspectFit.swift",
                "Classes/Core/UIImageView+Tools.swift",
                "Classes/Core/ZoomAnimatedTransitioning.swift",
            ],
            resources: [
                .copy("Assets/ic_cross_white@2x.png"),
                .copy("Assets/ic_cross_white@3x.png"),
            ]),
        .target(
            name: "ImageSlideshowKingfisher",
            dependencies: ["ImageSlideshow", "Kingfisher"],
            path: "Sources/ImageSlideshow/Classes/InputSources",
            sources: ["KingfisherSource.swift"]),
        .testTarget(
            name: "ImageSlideshowSPMTests",
            dependencies: ["ImageSlideshow"])
    ]
)
