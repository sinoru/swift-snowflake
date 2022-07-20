//
//  Foundation+JSONEncoder.swift
//  
//
//  Created by Jaehong Kang on 2022/07/20.
//

import Foundation

extension JSONEncoder {
    /// The strategy to use in encoding `Snowflake` values. Defaults to `.number`.
    public var snowflakeEncodingStrategy: SnowflakeEncodingStrategy {
        get {
            userInfo.snowflakeEncodingStrategy
        }
        set {
            userInfo.snowflakeEncodingStrategy = newValue
        }
    }
}
