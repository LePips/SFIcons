import SwiftUI

public extension SFIcon {

    enum Style: Codable, Equatable, Hashable {

        case color(Color)
        case angularGradient(colors: [Color], center: UnitPoint, startAngle: Angle, endAngle: Angle)

        public var swiftUIStyle: any ShapeStyle {
            switch self {
            case let .color(color):
                return color
            case let .angularGradient(colors: colors, center: center, startAngle: startAngle, endAngle: endAngle):
                return AngularGradient(
                    colors: colors,
                    center: center,
                    startAngle: startAngle,
                    endAngle: endAngle
                )
            }
        }
    }
}
