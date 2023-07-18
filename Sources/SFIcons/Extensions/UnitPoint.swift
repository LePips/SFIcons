//
//  UnitPoint.swift
//  SFIcons
//

import SwiftUI

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
