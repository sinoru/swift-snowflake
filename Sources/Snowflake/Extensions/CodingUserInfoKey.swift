//
//  CodingUserInfoKey.swift
//  
//
//  Created by Jaehong Kang on 2022/07/20.
//

extension CodingUserInfoKey {
    /// The `CodingUserInfoKey` to store strategy to use for decoding `Snowflake` values.
    static let snowflakeDecodingStrategy = CodingUserInfoKey(rawValue: String(reflecting: SnowflakeDecodingStrategy.self))!

    /// The `CodingUserInfoKey` to store strategy to use for encoding `Snowflake` values.
    static let snowflakeEncodingStrategy = CodingUserInfoKey(rawValue: String(reflecting: SnowflakeEncodingStrategy.self))!
}

/// The strategy to use for decoding `Snowflake` values.
public enum SnowflakeDecodingStrategy: Sendable {
    /// Decode the `Snowflake` from a JSON number or string.
    case auto

    /// Decode the `Snowflake` from a JSON string.
    case string

    /// Decode the `Snowflake` from a JSON number.
    case number
}

/// The strategy to use for encoding `Snowflake` values.
public enum SnowflakeEncodingStrategy: Sendable {
    /// Encode the `Date` as a JSON string.
    case string

    /// Encode the `Date` as a JSON number.
    case number
}

extension Dictionary where Key == CodingUserInfoKey, Value == Any {
    /// The strategy to use in decoding `Snowflake` values. Defaults to `.auto`.
    public var snowflakeDecodingStrategy: SnowflakeDecodingStrategy {
        get {
            self[CodingUserInfoKey.snowflakeDecodingStrategy] as? SnowflakeDecodingStrategy ?? .auto
        }
        mutating set {
            self[CodingUserInfoKey.snowflakeDecodingStrategy] = newValue
        }
    }

    /// The strategy to use in encoding `Snowflake` values. Defaults to `.number`.
    public var snowflakeEncodingStrategy: SnowflakeEncodingStrategy {
        get {
            self[CodingUserInfoKey.snowflakeEncodingStrategy] as? SnowflakeEncodingStrategy ?? .number
        }
        mutating set {
            self[CodingUserInfoKey.snowflakeEncodingStrategy] = newValue
        }
    }
}
