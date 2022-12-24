# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.0]
### Added
- Add [`stringValue`](https://shizukusoft.github.io/swift-snowflake/documentation/snowflake/snowflake/stringvalue) on `Snowflake`

### Changed
- Split `SnowflakeFoundationCompat` from `Snowflake`
- Change [`Int64`](https://developer.apple.com/documentation/swift/int64) to [`UInt64`](https://developer.apple.com/documentation/swift/uint64) on [`Snowflake.RawValue`](https://shizukusoft.github.io/swift-snowflake/documentation/snowflake/snowflake/rawvalue-swift.typealias)

## [0.0.2]
### Added
- [`Snowflake`](Sources/Snowflake/Snowflake.swift) conforms to [`Comparable`](https://developer.apple.com/documentation/swift/comparable).

### Fixed
- Dummy `Sendable` protocol will not be evaluated on Swift 5.5 or later compiler.

### Removed
- Remove `CodingUserInfoKey.snowflakeDecodingStrategy`, `CodingUserInfoKey.snowflakeEncodingStrategy` from public.

## [0.0.1]
This is the initial release.

[Unreleased]: https://github.com/shizukusoft/swift-snowflake/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/shizukusoft/swift-snowflake/compare/v0.0.2...v1.0.0
[0.0.2]: https://github.com/shizukusoft/swift-snowflake/compare/v0.0.1...v0.0.2
[0.0.1]: https://github.com/shizukusoft/swift-snowflake/releases/tag/v0.0.1
