//
//  SnowflakeProtocol+Conformances.swift
//
//
//  Created by Jaehong Kang on 8/17/24.
//

// Comparable
extension SnowflakeProtocol {
    @inlinable
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

// LosslessStringConvertible
extension SnowflakeProtocol {
    public var description: String {
        rawValue.description
    }

    public init?(_ description: String) {
        self.init(rawValue: RawValue(description))
    }
}

// Decodable
extension SnowflakeProtocol {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        switch decoder.userInfo.snowflakeDecodingStrategy {
        case .auto:
            do {
                let rawValue = try container.decode(RawValue.self)

                self.init(rawValue: rawValue)
            } catch {
                let string = try container.decode(String.self)

                guard let rawValue = RawValue(string) else {
                    throw DecodingError.dataCorrupted(.init(codingPath: decoder.codingPath, debugDescription: "\(string) can not be parsed as Int64!"))
                }

                self.init(rawValue: rawValue)
            }
        case .string:
            let string = try container.decode(String.self)

            guard let rawValue = RawValue(string) else {
                throw DecodingError.dataCorrupted(.init(codingPath: decoder.codingPath, debugDescription: "\(string) can not be parsed as Int64!"))
            }

            self.init(rawValue: rawValue)
        case .number:
            self.init(rawValue: try container.decode(RawValue.self))
        }
    }
}

// Encodable
extension SnowflakeProtocol {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch encoder.userInfo.snowflakeEncodingStrategy {
        case .string:
            try container.encode(String(rawValue))
        case .number:
            try container.encode(rawValue)
        }
    }
}
