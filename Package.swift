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
        .package(url: "https://github.com/facephi-clienters/SDK-FPHIDesignSystemResources-SPM.git", .upToNextMinor(from: "2.7.4")),
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
            url: "https://facephicorp.jfrog.io/artifactory/spm-pro-fphi/WIDGET/FPHINfcWidget/0.3.3/FPHINfcWidget.zip",
            checksum: "980374d2ae91338da327dcf8e908c5f1777a3fdd383daefde130f3775014dad0"
        ),
    ]
)
