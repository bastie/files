// swift-tools-version: 6.4
//
//  SPDX-FileCopyrightText: © 2026 Sebastian Ritter. Alle Rechte vorbehalten.
//  SPDX-License-Identifier: Apache-2.0
//

import PackageDescription

let package = Package(
    name: "files",
    platforms: [.macOS(.v27), .iOS(.v27)],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", exact: "1.8.2"),
    ],
    targets: [
        .executableTarget(
            name: "files",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ],
        ),
        .testTarget(
            name: "filesTests",
            dependencies: ["files"],
            resources: [
              // wir nutzen process statt copy um eine flache Kopie in das Testverzeichnis zu legen
              .process("testdaten")
            ]
        ),
    ]
)
