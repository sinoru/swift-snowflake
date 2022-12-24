//
//  Snowflake.swift
//
//
//  Created by Jaehong Kang on 2022/07/19.
//

public struct Snowflake: RawRepresentable, Equatable, Hashable, Sendable {
    public typealias RawValue = UInt64

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

    public var stringValue: String {
        String(rawValue)
    }
}

extension Snowflake: Comparable {
    public static func < (lhs: Snowflake, rhs: Snowflake) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

extension Snowflake: LosslessStringConvertible {
    public var description: String {
        String(rawValue)
    }
}

extension Snowflake: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: RawValue) {
        self.init(value)
    }
}
