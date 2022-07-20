# swift-snowflake

[![Test](https://github.com/sinoru/swift-snowflake/actions/workflows/test.yml/badge.svg)](https://github.com/sinoru/swift-snowflake/actions/workflows/test.yml)

A Swift library for Snowflake ID.

## Using **swift-snowflake** in your project

To use this package in a SwiftPM project, you need to set it up as a package dependency:

```swift
// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "MyPackage",
  dependencies: [
    .package(
      url: "https://github.com/sinoru/swift-snowflake.git", 
      .upToNextMajor(from: "1.0.0") // or `.upToNextMinor
    )
  ],
  targets: [
    .target(
      name: "MyTarget",
      dependencies: [
        .product(name: "Snowflake", package: "swift-snowflake")
      ]
    )
  ]
)
```
