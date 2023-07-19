import SwiftUI

public extension SFIcon {

    enum Style: Codable, Equatable, Hashable {

        case color(Color)
        case angularGradient(colors: [Color], center: UnitPoint, startAngle: Angle, endAngle: Angle)
        case ellipticalGradient(colors: [Color], center: UnitPoint, startRadiusFraction: CGFloat, endRadiusFraction: CGFloat)
        case linearGradient(colors: [Color], startPoint: UnitPoint, endPoint: UnitPoint)
        case radialGradient(colros: [Color], center: UnitPoint, startRadius: CGFloat, endRadius: CGFloat)

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
            case let .ellipticalGradient(colors: colors, center: center, startRadiusFraction: start, endRadiusFraction: end):
                return EllipticalGradient(
                    colors: colors,
                    center: center,
                    startRadiusFraction: start,
                    endRadiusFraction: end
                )
            case let .linearGradient(colors: colors, startPoint: startPoint, endPoint: endPoint):
                return LinearGradient(
                    colors: colors,
                    startPoint: startPoint,
                    endPoint: endPoint
                )
            case let .radialGradient(colros: colors, center: center, startRadius: start, endRadius: end):
                return RadialGradient(
                    colors: colors,
                    center: center,
                    startRadius: start,
                    endRadius: end
                )
            }
        }
    }
}
