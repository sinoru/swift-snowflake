//
//  Snowflake+Conformances.swift
//
//
//  Created by Jaehong Kang on 8/17/24.
//

extension Snowflake: RawRepresentable {
    public typealias RawValue = UInt64
}

extension Snowflake: Comparable {
    public static func < (lhs: Snowflake, rhs: Snowflake) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

extension Snowflake: LosslessStringConvertible {
    public var description: String {
        rawValue.description
    }
}
