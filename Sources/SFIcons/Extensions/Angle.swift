//
//  Angle.swift
//  SFIcons
//

import SwiftUI

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

extension Angle: Codable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let degrees = try container.decode(Double.self)
        self = Angle(degrees: degrees)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(degrees)
    }
}

extension UnitPoint: Codable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)
        let x = try container.decode(CGFloat.self, forKey: .key("x"))
        let y = try container.decode(CGFloat.self, forKey: .key("y"))
        self = UnitPoint(x: x, y: y)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)
        try container.encode(x, forKey: .key("x"))
        try container.encode(y, forKey: .key("y"))
    }
}
