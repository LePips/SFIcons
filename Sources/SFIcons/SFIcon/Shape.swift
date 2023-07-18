//
//  Shape.swift
//  SFIcons
//

import SwiftUI

extension SFIcon {
    
    enum Shape: Codable, Equatable, Hashable {
        
        case circle
        case roundedRectangle(cornerRadius: CGFloat)
        
        var swiftUIShape: any SwiftUI.Shape {
            switch self {
            case .circle:
                Circle()
            case .roundedRectangle(cornerRadius: let cornerRadius):
                RoundedRectangle(cornerRadius: cornerRadius)
            }
        }
        
        func isSameCase(_ rhs: Shape) -> Bool {
            switch (self, rhs) {
            case (.circle, .circle), (.roundedRectangle, .roundedRectangle):
                true
            default:
                false
            }
        }
    }
}
