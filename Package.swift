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
        .package(url: "https://github.com/facephi-clienters/SDK-FPHIDesignSystemResources-SPM.git", .upToNextMinor(from: "1.0.0")),
        .package(url: "https://github.com/facephi-clienters/FPBTokenizer-SPM.git", .upToNextMajor(from: "4.0.4")),
        .package(url: "https://github.com/facephi-clienters/FPHILicenseManager-SPM.git", .upToNextMajor(from: "0.5.6")),
        .package(url: "https://github.com/facephi-clienters/FPHILicenseActivator-SPM.git", exact: "1.0.1"),
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
            url: "https://facephicorp.jfrog.io/artifactory/spm-pro-fphi/WIDGET/FPHINfcWidget/0.2.2/FPHINfcWidget.zip",
            checksum: "e891f0ec0aca62c59fd73ecdf52cafccba0865ef411014fb6d646c662c181dae"
        ),
    ]
)
