import SFIcons
import SwiftUI

extension ContentView {

    static let DefaultStyles: [SFIcon.Style] = {

        let colors: [SFIcon.Style] = [
            .white,
            .black,
            .red,
            .orange,
            .yellow,
            .green,
            .cyan,
            .blue,
            .indigo,
            Color(.displayP3, red: 235 / 255, green: 93 / 255, blue: 122 / 255),
            .purple,
            .brown,
            .gray,
            Color(.displayP3, red: 255 / 255, green: 181 / 255, blue: 174 / 255),
        ]
            .map { SFIcon.Style.color($0) }

        let gradients = [
            SFIcon.Style.angularGradient(
                colors: [.red, .orange, .yellow, .green, .blue, .purple, .red],
                center: .center,
                startAngle: .zero,
                endAngle: Angle(degrees: 360)
            ),
        ]

        return colors + gradients
    }()

    static let DefaultSystemNames: [String] = [
        "list.bullet",
        "bookmark.fill",
        "mappin",
        "gift.fill",
        "birthday.cake.fill",
        "graduationcap.fill",
        "backpack.fill",
        "pencil.and.ruler.fill",
        "doc.fill",
        "book.fill",
        "creditcard.fill",
        "banknote.fill",
        "dumbbell.fill",
        "figure.run",
        "fork.knife",
        "wineglass.fill",
        "pills.fill",
        "stethoscope",
        "chair.lounge.fill",
        "house.fill",
        "building.2.fill",
        "building.columns.fill",
        "tent.fill",
        "tv",
        "music.note",
        "macpro.gen3.fill",
        "gamecontroller.fill",
        "headphones",
        "leaf.fill",
        "carrot.fill",
        "figure.arms.open",
        "figure.2.arms.open",
        "figure.2.and.child.holdinghands",
        "pawprint.fill",
        "teddybear.fill",
        "fish.fill",
        "basket.fill",
        "cart.fill",
        "bag.fill",
        "shippingbox.fill",
        "soccerball",
        "baseball.fill",
        "football.fill",
        "tennis.racket",
        "tram.fill",
        "airplane",
        "sailboat.fill",
        "car.fill",
        "beach.umbrella.fill",
        "sun.max.fill",
        "moon.fill",
        "drop.fill",
        "snowflake",
        "flame.fill",
        "handbag.fill",
        "wrench.and.screwdriver.fill",
        "scissors",
        "compass.drawing",
        "curlybraces",
        "lightbulb.fill",
        "bubble.left.fill",
        "asterisk",
        "stop.fill",
        "circle.fill",
        "triangle.fill",
        "diamond.fill",
        "heart.fill",
        "star.fill",
    ]
}

extension View {

    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}
