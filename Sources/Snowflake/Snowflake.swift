//
//  Snowflake.swift
//
//
//  Created by Jaehong Kang on 8/17/24.
//

public struct Snowflake: SnowflakeProtocol {
    public static let timestampBitWidth: Int = 10

    public var rawValue: RawValue

    public init(rawValue: RawValue) {
        self.rawValue = rawValue
    }
}
