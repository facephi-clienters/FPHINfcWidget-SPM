// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "FPHINfcWidget-SPM",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "FPHINfcWidget",
            targets: [
                "FPHINfcWidget-SPM",
                "FPHINfcWidget",
            ]
        ),
        .library(
            name: "FPBTokenizerShared",
            targets: [
                "FPBTokenizerShared",
            ]
        ),
        .library(
            name: "FPHINfcWidgetResources",
            targets: [
                "FPHINfcWidgetResources-SPM",
            ]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/facephi-clienters/SDK-FPHIDesignSystemResources-SPM.git",
            .upToNextMinor(from: "2.8.0")
        ),
        .package(url: "https://github.com/facephi-clienters/FPBTokenizer-SPM.git", .upToNextMajor(from: "4.0.4")),
        .package(url: "https://github.com/facephi-clienters/FPHILicenseManager-SPM.git", .upToNextMajor(from: "0.5.6")),
        .package(url: "https://github.com/facephi-clienters/FPHILicenseActivator-SPM.git", exact: "1.0.2"),
    ],
    targets: [
        .target(
            name: "FPHINfcWidget-SPM",
            dependencies: [
                "FPHINfcWidget",
                "FPHINfcWidgetResources-SPM",
                .product(name: "FPBTokenizer-SPM", package: "FPBTokenizer-SPM"),
                .product(name: "FPHILicenseManager-SPM", package: "FPHILicenseManager-SPM"),
                .product(name: "FPHILicenseActivator-SPM", package: "FPHILicenseActivator-SPM"),
                .product(name: "FPHIDesignSystemResources", package: "SDK-FPHIDesignSystemResources-SPM"),
            ]
        ),
        .target(
            name: "FPBTokenizerShared",
            dependencies: [
                .product(name: "FPBTokenizer-SPM", package: "FPBTokenizer-SPM"),
            ]
        ),
        .target(
            name: "FPHINfcWidgetResources-SPM",
            resources: [.copy("compose/cocoapods/compose-resources")]
        ),
        .binaryTarget(
            name: "FPHINfcWidget",
            url: "https://facephicorp.jfrog.io/artifactory/spm-pro-fphi/WIDGET/FPHINfcWidget/0.4.12/FPHINfcWidget.zip",
            checksum: "4e660572cbd96cb4828e72fa4ab07b2a82245e2fe26bfc813c0502a55dfd45db"
        ),
    ]
)
