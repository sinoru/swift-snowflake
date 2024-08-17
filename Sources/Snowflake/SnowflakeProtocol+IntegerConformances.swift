//
//  SnowflakeProtocol+IntegerConformances.swift
//
//
//  Created by Jaehong Kang on 8/17/24.
//

// AdditiveArithmetic
extension SnowflakeProtocol {
    public static func + (lhs: Self, rhs: Self) -> Self {
        .init(rawValue: lhs.rawValue + rhs.rawValue)
    }

    public static func - (lhs: Self, rhs: Self) -> Self {
        .init(rawValue: lhs.rawValue - rhs.rawValue)
    }
}

// ExpressibleByIntegerLiteral
extension SnowflakeProtocol {
    public init(integerLiteral value: RawValue) {
        self.init(value)
    }
}

// Numeric
extension SnowflakeProtocol {
    public static func * (lhs: Self, rhs: Self) -> Self {
        self.init(rawValue: lhs.rawValue * rhs.rawValue)
    }

    public static func *= (lhs: inout Self, rhs: Self) {
        lhs.rawValue *= rhs.rawValue
    }

    public var magnitude: RawValue.Magnitude {
        rawValue.magnitude
    }

    public init?<T>(exactly source: T) where T : BinaryInteger {
        self.init(rawValue: RawValue(exactly: source))
    }
}

// Strideable
extension SnowflakeProtocol {
    public func distance(to other: Self) -> RawValue.Stride {
        rawValue.distance(to: other.rawValue)
    }

    public func advanced(by n: RawValue.Stride) -> Self {
        Self.init(rawValue: rawValue.advanced(by: n))
    }
}

// BinaryInteger
extension SnowflakeProtocol {
    public static var isSigned: Bool {
        RawValue.isSigned
    }

    public static prefix func ~ (x: Self) -> Self {
        .init(rawValue: ~x.rawValue)
    }

    public static func <<= <RHS>(lhs: inout Self, rhs: RHS) where RHS : BinaryInteger {
        lhs.rawValue <<= rhs
    }

    public static func >>= <RHS>(lhs: inout Self, rhs: RHS) where RHS : BinaryInteger {
        lhs.rawValue >>= rhs
    }

    public static func / (lhs: Self, rhs: Self) -> Self {
        .init(rawValue: lhs.rawValue / rhs.rawValue)
    }

    public static func % (lhs: Self, rhs: Self) -> Self {
        .init(rawValue: lhs.rawValue % rhs.rawValue)
    }

    public static func %= (lhs: inout Self, rhs: Self) {
        lhs.rawValue %= rhs.rawValue
    }

    public static func &= (lhs: inout Self, rhs: Self) {
        lhs.rawValue &= rhs.rawValue
    }

    public static func |= (lhs: inout Self, rhs: Self) {
        lhs.rawValue |= rhs.rawValue
    }

    public static func ^= (lhs: inout Self, rhs: Self) {
        lhs.rawValue ^= rhs.rawValue
    }

    public static func /= (lhs: inout Self, rhs: Self) {
        lhs.rawValue /= rhs.rawValue
    }

    public var words: RawValue.Words {
        rawValue.words
    }

    public var bitWidth: Int {
        rawValue.bitWidth
    }

    public var trailingZeroBitCount: Int {
        rawValue.trailingZeroBitCount
    }

    public init?<T>(exactly source: T) where T : BinaryFloatingPoint {
        self.init(rawValue: RawValue(exactly: source))
    }

    public init<T>(_ source: T) where T : BinaryFloatingPoint {
        self.init(rawValue: RawValue(source))
    }

    public init<T>(_ source: T) where T : BinaryInteger {
        self.init(rawValue: RawValue(source))
    }

    public init<T>(clamping source: T) where T : BinaryInteger {
        self.init(rawValue: RawValue(clamping: source))
    }

    public init<T>(truncatingIfNeeded source: T) where T : BinaryInteger {
        self.init(rawValue: RawValue(truncatingIfNeeded: source))
    }
}

// FixedWidthInteger
extension SnowflakeProtocol {
    public static var bitWidth: Int {
        RawValue.bitWidth
    }

    public static var max: Self {
        self.init(rawValue: RawValue.max)
    }

    public static var min: Self {
        self.init(rawValue: RawValue.min)
    }

    public var nonzeroBitCount: Int {
        rawValue.nonzeroBitCount
    }

    public var leadingZeroBitCount: Int {
        rawValue.leadingZeroBitCount
    }

    public var byteSwapped: Self {
        .init(rawValue: rawValue.byteSwapped)
    }

    public init(_truncatingBits source: UInt) {
        self.init(rawValue: RawValue(_truncatingBits: source))
    }

    public func addingReportingOverflow(_ rhs: Self) -> (partialValue: Self, overflow: Bool) {
        let result = rawValue.addingReportingOverflow(rhs.rawValue)

        return (
            partialValue: .init(rawValue: result.partialValue),
            overflow: result.overflow
        )
    }

    public func subtractingReportingOverflow(_ rhs: Self) -> (partialValue: Self, overflow: Bool) {
        let result = rawValue.subtractingReportingOverflow(rhs.rawValue)

        return (
            partialValue: .init(rawValue: result.partialValue),
            overflow: result.overflow
        )
    }

    public func multipliedReportingOverflow(by rhs: Self) -> (partialValue: Self, overflow: Bool) {
        let result = rawValue.multipliedReportingOverflow(by: rhs.rawValue)

        return (
            partialValue: .init(rawValue: result.partialValue),
            overflow: result.overflow
        )
    }

    public func dividedReportingOverflow(by rhs: Self) -> (partialValue: Self, overflow: Bool) {
        let result = rawValue.dividedReportingOverflow(by: rhs.rawValue)

        return (
            partialValue: .init(rawValue: result.partialValue),
            overflow: result.overflow
        )
    }

    public func remainderReportingOverflow(dividingBy rhs: Self) -> (partialValue: Self, overflow: Bool) {
        let result = rawValue.remainderReportingOverflow(dividingBy: rhs.rawValue)

        return (
            partialValue: .init(rawValue: result.partialValue),
            overflow: result.overflow
        )
    }

    public func dividingFullWidth(_ dividend: (high: Self, low: RawValue.Magnitude)) -> (quotient: Self, remainder: Self) {
        let result = rawValue.dividingFullWidth((high: dividend.high.rawValue, low: dividend.low))

        return (
            quotient: .init(rawValue: result.quotient),
            remainder: .init(rawValue: result.remainder)
        )
    }
}
