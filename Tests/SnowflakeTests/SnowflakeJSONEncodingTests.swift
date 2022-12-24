//
//  SnowflakeJSONEncodingTests.swift
//  
//
//  Created by Jaehong Kang on 2022/07/20.
//

import XCTest
@testable import Snowflake
@testable import SnowflakeFoundationCompat

final class SnowflakeJSONEncodingTests: XCTestCase {
    func testDecodingNumber() throws {
        let examples: [Snowflake] = [175928847299117063, 1541815603606036480]

        let jsonEncoder = JSONEncoder()
        jsonEncoder.snowflakeEncodingStrategy = .number

        let data = try jsonEncoder.encode(examples)

        XCTAssertEqual(
            data,
            #"[175928847299117063,1541815603606036480]"#.data(using: .utf8)
        )
    }

    func testDecodingString() throws {
        let examples: [Snowflake] = [175928847299117063, 1541815603606036480]

        let jsonEncoder = JSONEncoder()
        jsonEncoder.snowflakeEncodingStrategy = .string

        let data = try jsonEncoder.encode(examples)

        XCTAssertEqual(
            data,
            #"["175928847299117063","1541815603606036480"]"#.data(using: .utf8)
        )
    }
}
