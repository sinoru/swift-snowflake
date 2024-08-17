//
//  Snowflake+IntegerConformances.swift
//
//
//  Created by Jaehong Kang on 8/17/24.
//

extension Snowflake {
    private init?(rawValue: RawValue?) {
        guard let rawValue = rawValue else {
            return nil
        }
        self.init(rawValue: rawValue)
    }
}

extension Snowflake: AdditiveArithmetic {
    public static func + (lhs: Snowflake, rhs: Snowflake) -> Snowflake {
        .init(rawValue: lhs.rawValue + rhs.rawValue)
    }

    public static func - (lhs: Snowflake, rhs: Snowflake) -> Snowflake {
        .init(rawValue: lhs.rawValue - rhs.rawValue)
    }
}

extension Snowflake: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: RawValue) {
        self.init(value)
    }
}

extension Snowflake: Numeric {
    public typealias Magnitude = RawValue.Magnitude

    public static func * (lhs: Snowflake, rhs: Snowflake) -> Snowflake {
        self.init(rawValue: lhs.rawValue * rhs.rawValue)
    }

    public static func *= (lhs: inout Snowflake, rhs: Snowflake) {
        lhs.rawValue *= rhs.rawValue
    }

    public var magnitude: RawValue.Magnitude {
        rawValue.magnitude
    }

    public init?<T>(exactly source: T) where T : BinaryInteger {
        self.init(rawValue: RawValue(exactly: source))
    }
}

extension Snowflake: Strideable {
    public typealias Stride = RawValue.Stride

    public func distance(to other: Snowflake) -> RawValue.Stride {
        rawValue.distance(to: other.rawValue)
    }

    public func advanced(by n: RawValue.Stride) -> Snowflake {
        Snowflake(rawValue: rawValue.advanced(by: n))
    }
}

extension Snowflake: BinaryInteger {
    public typealias Words = RawValue.Words

    public static var isSigned: Bool {
        RawValue.isSigned
    }

    public static prefix func ~ (x: Snowflake) -> Snowflake {
        .init(rawValue: ~x.rawValue)
    }

    public static func <<= <RHS>(lhs: inout Snowflake, rhs: RHS) where RHS : BinaryInteger {
        lhs.rawValue <<= rhs
    }

    public static func >>= <RHS>(lhs: inout Snowflake, rhs: RHS) where RHS : BinaryInteger {
        lhs.rawValue >>= rhs
    }

    public static func / (lhs: Snowflake, rhs: Snowflake) -> Snowflake {
        .init(rawValue: lhs.rawValue / rhs.rawValue)
    }

    public static func % (lhs: Snowflake, rhs: Snowflake) -> Snowflake {
        .init(rawValue: lhs.rawValue % rhs.rawValue)
    }

    public static func %= (lhs: inout Snowflake, rhs: Snowflake) {
        lhs.rawValue %= rhs.rawValue
    }

    public static func &= (lhs: inout Snowflake, rhs: Snowflake) {
        lhs.rawValue &= rhs.rawValue
    }

    public static func |= (lhs: inout Snowflake, rhs: Snowflake) {
        lhs.rawValue |= rhs.rawValue
    }

    public static func ^= (lhs: inout Snowflake, rhs: Snowflake) {
        lhs.rawValue ^= rhs.rawValue
    }

    public static func /= (lhs: inout Snowflake, rhs: Snowflake) {
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

extension Snowflake: FixedWidthInteger {
    public static var bitWidth: Int {
        RawValue.bitWidth
    }
    
    public static var max: Snowflake {
        Snowflake(rawValue: RawValue.max)
    }
    
    public static var min: Snowflake {
        Snowflake(rawValue: RawValue.min)
    }
    
    public var nonzeroBitCount: Int {
        rawValue.nonzeroBitCount
    }
    
    public var leadingZeroBitCount: Int {
        rawValue.leadingZeroBitCount
    }
    
    public var byteSwapped: Snowflake {
        .init(rawValue: rawValue.byteSwapped)
    }

    public init(_truncatingBits source: UInt) {
        self.init(rawValue: RawValue(_truncatingBits: source))
    }

    public func addingReportingOverflow(_ rhs: Snowflake) -> (partialValue: Snowflake, overflow: Bool) {
        let result = rawValue.addingReportingOverflow(rhs.rawValue)

        return (
            partialValue: .init(rawValue: result.partialValue),
            overflow: result.overflow
        )
    }

    public func subtractingReportingOverflow(_ rhs: Snowflake) -> (partialValue: Snowflake, overflow: Bool) {
        let result = rawValue.subtractingReportingOverflow(rhs.rawValue)

        return (
            partialValue: .init(rawValue: result.partialValue),
            overflow: result.overflow
        )
    }

    public func multipliedReportingOverflow(by rhs: Snowflake) -> (partialValue: Snowflake, overflow: Bool) {
        let result = rawValue.multipliedReportingOverflow(by: rhs.rawValue)

        return (
            partialValue: .init(rawValue: result.partialValue),
            overflow: result.overflow
        )
    }

    public func dividedReportingOverflow(by rhs: Snowflake) -> (partialValue: Snowflake, overflow: Bool) {
        let result = rawValue.dividedReportingOverflow(by: rhs.rawValue)

        return (
            partialValue: .init(rawValue: result.partialValue),
            overflow: result.overflow
        )
    }

    public func remainderReportingOverflow(dividingBy rhs: Snowflake) -> (partialValue: Snowflake, overflow: Bool) {
        let result = rawValue.remainderReportingOverflow(dividingBy: rhs.rawValue)

        return (
            partialValue: .init(rawValue: result.partialValue),
            overflow: result.overflow
        )
    }

    public func dividingFullWidth(_ dividend: (high: Snowflake, low: RawValue.Magnitude)) -> (quotient: Snowflake, remainder: Snowflake) {
        let result = rawValue.dividingFullWidth((high: dividend.high.rawValue, low: dividend.low))

        return (
            quotient: .init(rawValue: result.quotient),
            remainder: .init(rawValue: result.remainder)
        )
    }
}

extension Snowflake: UnsignedInteger { }
