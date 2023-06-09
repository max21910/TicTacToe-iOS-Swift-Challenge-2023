// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "Tic Tac Toe Game",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "Tic Tac Toe Game",
            targets: ["AppModule"],
            bundleIdentifier: "com.max21160.Emojie-Speed-Games",
            teamIdentifier: "JBDCCGS2V3",
            displayVersion: "4.0",
            bundleVersion: "1",
            appIcon: .asset("AppIcon"),
            accentColor: .presetColor(.pink),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ],
            appCategory: .games
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ]
)