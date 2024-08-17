//
//  SnowflakeTests.swift
//  
//
//  Created by Jaehong Kang on 8/17/24.
//

import XCTest
@testable import Snowflake

final class SnowflakeTests: XCTestCase {
    func testIntegerLiteral() {
        let snowflake: Snowflake = 1824607532228804608

        XCTAssertEqual(snowflake.rawValue, 1824607532228804608)
    }
}
