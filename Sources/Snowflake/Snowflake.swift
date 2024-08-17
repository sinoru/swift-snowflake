//
//  Snowflake.swift
//
//
//  Created by Jaehong Kang on 2022/07/19.
//

public struct Snowflake: Equatable, Hashable, Sendable {
    public var rawValue: RawValue

    public init(rawValue: RawValue) {
        self.rawValue = rawValue
    }
}

extension Snowflake {
    public init(_ value: RawValue) {
        self.init(rawValue: value)
    }

    public init?(_ value: String) {
        guard let value = RawValue(value) else {
            return nil
        }

        self.init(rawValue: value)
    }
}
