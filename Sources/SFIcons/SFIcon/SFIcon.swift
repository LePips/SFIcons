import Foundation
import SwiftUI

public struct SFIcon: Codable, Hashable {

    public let icon: Icon
    public let iconStyle: Style
    public let shape: Shape
    public let shapeStyle: Style

    public init(icon: Icon, iconStyle: Style, shape: Shape, shapeStyle: Style) {
        self.icon = icon
        self.iconStyle = iconStyle
        self.shape = shape
        self.shapeStyle = shapeStyle
    }
}
