# swift-snowflake

| **main** | **develop** |
|:---:|:---:|
| [![Test](https://github.com/sinoru/swift-snowflake/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/sinoru/swift-snowflake/actions/workflows/test.yml) | [![Test](https://github.com/sinoru/swift-snowflake/actions/workflows/test.yml/badge.svg?branch=develop)](https://github.com/sinoru/swift-snowflake/actions/workflows/test.yml) |

A Swift library for [Snowflake ID](https://en.wikipedia.org/wiki/Snowflake_ID).

## Package Products

* [`Snowflake`](https://sinoru.github.io/swift-snowflake/documentation/snowflake), main library that contains `Snowflake`. (without importing Foundation)
* [`SnowflakeFoundationCompat`](https://sinoru.github.io/swift-snowflake/documentation/snowflakefoundationcompat), library that contains make `Snowflake` interoperate better with Foundation.
  * `JSONDecoder`, `JSONEncoder` extensions for easily using on JSON parse.

## Supported Platforms

swift-snowflake aims to support all of the platforms where Swift 5.3 or later is supported.

## Example

```swift
import Snowflake

let someSnowflakeID: Snowflake = 1822504365596868608
```

```swift
import SnowflakeFoundationCompat

let examples: [Snowflake] = [175928847299117063, 1541815603606036480]

let jsonEncoder = JSONEncoder()
jsonEncoder.snowflakeEncodingStrategy = .number

let data = try jsonEncoder.encode(examples)

```

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
