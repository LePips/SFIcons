import SwiftUI

public extension SFIcon {

    enum Shape: Codable, Equatable, Hashable {

        case circle
        case roundedRectangle(cornerRadius: CGFloat)

        public var swiftUIShape: any SwiftUI.Shape {
            switch self {
            case .circle:
                return Circle()
            case let .roundedRectangle(cornerRadius: cornerRadius):
                return RoundedRectangle(cornerRadius: cornerRadius)
            }
        }

        public func isSameCase(_ rhs: Shape) -> Bool {
            switch (self, rhs) {
            case (.circle, .circle), (.roundedRectangle, .roundedRectangle):
                return true
            default:
                return false
            }
        }
    }
}
