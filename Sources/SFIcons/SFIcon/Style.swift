import SwiftUI

extension SFIcon {

    enum Style: Codable, Equatable, Hashable {

        case color(Color)
        case angularGradient(colors: [Color], center: UnitPoint, startAngle: Angle, endAngle: Angle)

        var swiftUIStyle: any ShapeStyle {
            switch self {
            case let .color(color):
                color
            case let .angularGradient(colors: colors, center: center, startAngle: startAngle, endAngle: endAngle):
                AngularGradient(
                    colors: colors,
                    center: center,
                    startAngle: startAngle,
                    endAngle: endAngle
                )
            }
        }
    }
}
