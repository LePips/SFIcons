import SwiftUI

extension Color: Codable {

    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        let codableColor = try container.decode(CodableColor.self)
        self = Color(codableColor: codableColor)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(codableColor)
    }
}

struct CodableColor: Codable {

    var red: Double = 0.0
    var green: Double = 0.0
    var blue: Double = 0.0
    var alpha: Double = 0.0

    var color: Color {
        Color(uiColor: uiColor)
    }

    var uiColor: UIColor {
        UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

    init(uiColor: UIColor) {

        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)

        self.red = r
        self.green = g
        self.blue = b
        self.alpha = a
    }

    init(color: Color) {
        self.init(uiColor: UIColor(color))
    }
}

extension Color {

    init(codableColor: CodableColor) {
        self.init(uiColor: codableColor.uiColor)
    }

    var codableColor: CodableColor {
        CodableColor(color: self)
    }
}
