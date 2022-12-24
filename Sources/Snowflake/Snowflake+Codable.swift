//
//  Snowflake+Codable.swift
//  
//
//  Created by Jaehong Kang on 2022/07/20.
//

extension Snowflake: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        switch decoder.userInfo.snowflakeDecodingStrategy {
        case .auto:
            do {
                let rawValue = try container.decode(RawValue.self)

                self.rawValue = rawValue
            } catch {
                let string = try container.decode(String.self)

                guard let rawValue = RawValue(string) else {
                    throw DecodingError.dataCorrupted(.init(codingPath: decoder.codingPath, debugDescription: "\(string) can not be parsed as Int64!"))
                }

                self.rawValue = rawValue
            }
        case .string:
            let string = try container.decode(String.self)

            guard let rawValue = RawValue(string) else {
                throw DecodingError.dataCorrupted(.init(codingPath: decoder.codingPath, debugDescription: "\(string) can not be parsed as Int64!"))
            }

            self.rawValue = rawValue
        case .number:
            self.rawValue = try container.decode(RawValue.self)
        }
    }
}

extension Snowflake: Encodable {
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
