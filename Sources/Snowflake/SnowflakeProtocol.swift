//
//  SnowflakeProtocol.swift
//
//
//  Created by Jaehong Kang on 2022/07/19.
//

public protocol SnowflakeProtocol: Sendable, Codable, RawRepresentable, UnsignedInteger, FixedWidthInteger
where RawValue == UInt64, Magnitude == RawValue.Magnitude, Stride == RawValue.Stride, Words == RawValue.Words {
    static var timestampBitWidth: Int { get }

    var rawValue: RawValue { get set }

    init(rawValue: RawValue)
}

extension SnowflakeProtocol {
    @usableFromInline
    internal init?(rawValue: RawValue?) {
        guard let rawValue = rawValue else {
            return nil
        }
        self.init(rawValue: rawValue)
    }
}
