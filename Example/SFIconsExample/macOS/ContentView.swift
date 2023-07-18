import SFIcons
import SwiftUI

struct ContentView: View {

    @State
    private var sfIcon: SFIcon = .init(
        icon: .sfSymbol(systemName: "list.bullet"),
        iconStyle: .color(.white),
        shape: .circle,
        shapeStyle: .color(.red)
    )

    var body: some View {
        VStack(spacing: 100) {

            SFIconView(sfIcon: sfIcon)
                .fontWeight(.medium)
                .frame(width: 500, height: 500)

            Button {
                let randomIcon: SFIcon.Icon = [
                    .sfSymbol(systemName: Self.DefaultSystemNames.randomElement()!),
                    .string(String.randomEmoji()),
                ]
                    .randomElement()!
                let randomShape: SFIcon.Shape = [
                    .circle,
                    .roundedRectangle(cornerRadius: 25),
                ]
                    .randomElement()!
                let randomShapeStyle = Self.DefaultStyles.randomElement()!

                var availableStyles = Self.DefaultStyles
                availableStyles.removeAll(where: { $0 == randomShapeStyle })
                let randomIconStyle = availableStyles.randomElement()!

                withAnimation(.linear(duration: 0.1)) {
                    sfIcon = .init(
                        icon: randomIcon,
                        iconStyle: randomIconStyle,
                        shape: randomShape,
                        shapeStyle: randomShapeStyle
                    )
                }
            } label: {
                Image(systemName: "dice.fill")
                    .resizable()
                    .padding()
                    .frame(width: 100, height: 100)
            }
            .buttonStyle(.plain)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
