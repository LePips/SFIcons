//
//  StringCodingKey.swift
//  SFIcons
//

import Foundation

struct StringCodingKey: CodingKey {
    
    var stringValue: String
    var intValue: Int?
    
    init?(intValue: Int) {
        nil
    }
    
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    static func key(_ key: String) -> StringCodingKey {
        StringCodingKey(stringValue: key)!
    }
}
