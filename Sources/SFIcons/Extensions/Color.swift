import SwiftUI

#if os(macOS)
typealias SystemColor = NSColor
#else
typealias SystemColor = UIColor
#endif

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
        #if os(macOS)
        Color(nsColor: uiColor)
        #else
        Color(uiColor: uiColor)
        #endif
    }

//    #if os(macOS)

//    #else
    var uiColor: SystemColor {
        SystemColor(red: red, green: green, blue: blue, alpha: alpha)
    }

//    #endif

//    #if os(macOS)
//    init(uiColor: NSColor) {
//
//        var r: CGFloat = 0
//        var g: CGFloat = 0
//        var b: CGFloat = 0
//        var a: CGFloat = 0
//
//        uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)
//
//        self.red = r
//        self.green = g
//        self.blue = b
//        self.alpha = a
//    }
//    #else
    init(uiColor: SystemColor) {

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

//    #endif

    init(color: Color) {
        self.init(uiColor: SystemColor(color))
    }
}

extension Color {

    init(codableColor: CodableColor) {
        #if os(macOS)
        self.init(nsColor: codableColor.uiColor)
        #else
        self.init(uiColor: codableColor.uiColor)
        #endif
    }

    var codableColor: CodableColor {
        CodableColor(color: self)
    }
}
