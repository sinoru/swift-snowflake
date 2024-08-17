//
//  SnowflakeJSONDecodingTests.swift
//  
//
//  Created by Jaehong Kang on 2022/07/20.
//

import XCTest
import Snowflake
@testable import SnowflakeFoundationCompat

final class SnowflakeJSONDecodingTests: XCTestCase {
    func testDecodingAuto() throws {
        let examplesData = """
        [
            175928847299117063,
            "1541815603606036480"
        ]
        """.data(using: .utf8)!

        let jsonDecoder = JSONDecoder()
        jsonDecoder.snowflakeDecodingStrategy = .auto

        let examples = try jsonDecoder.decode([Snowflake].self, from: examplesData)

        XCTAssertEqual(examples[0], 175928847299117063)
        XCTAssertEqual(examples[1], 1541815603606036480)
    }

    func testDecodingString() throws {
        let examplesData = """
        [
            "175928847299117063",
            "1541815603606036480"
        ]
        """.data(using: .utf8)!

        let jsonDecoder = JSONDecoder()
        jsonDecoder.snowflakeDecodingStrategy = .string

        let examples = try jsonDecoder.decode([Snowflake].self, from: examplesData)

        XCTAssertEqual(examples[0], 175928847299117063)
        XCTAssertEqual(examples[1], 1541815603606036480)
    }

    func testDecodingStringMixed() throws {
        let examplesData = """
        [
            175928847299117063,
            "1541815603606036480"
        ]
        """.data(using: .utf8)!

        let jsonDecoder = JSONDecoder()
        jsonDecoder.snowflakeDecodingStrategy = .string

        XCTAssertThrowsError(try jsonDecoder.decode([Snowflake].self, from: examplesData))
    }

    func testDecodingNumber() throws {
        let examplesData = """
        [
            175928847299117063,
            1541815603606036480
        ]
        """.data(using: .utf8)!

        let jsonDecoder = JSONDecoder()
        jsonDecoder.snowflakeDecodingStrategy = .number

        let examples = try jsonDecoder.decode([Snowflake].self, from: examplesData)

        XCTAssertEqual(examples[0], 175928847299117063)
        XCTAssertEqual(examples[1], 1541815603606036480)
    }

    func testDecodingNumberMixed() throws {
        let examplesData = """
        [
            175928847299117063,
            "1541815603606036480"
        ]
        """.data(using: .utf8)!

        let jsonDecoder = JSONDecoder()
        jsonDecoder.snowflakeDecodingStrategy = .number

        XCTAssertThrowsError(try jsonDecoder.decode([Snowflake].self, from: examplesData))
    }
}
