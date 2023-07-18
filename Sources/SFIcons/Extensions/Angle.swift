//
//  Angle.swift
//  SFIcons
//

import SwiftUI

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
