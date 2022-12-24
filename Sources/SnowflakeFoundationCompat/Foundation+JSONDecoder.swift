//
//  Foundation+JSONDecoder.swift
//  
//
//  Created by Jaehong Kang on 2022/07/20.
//

import Foundation
import Snowflake

extension JSONDecoder {
    /// The strategy to use in decoding `Snowflake` values. Defaults to `.auto`.
    public var snowflakeDecodingStrategy: SnowflakeDecodingStrategy {
        get {
            userInfo.snowflakeDecodingStrategy
        }
        set {
            userInfo.snowflakeDecodingStrategy = newValue
        }
    }
}
