import SFIcons
import SwiftUI

struct ContentView: View {

    @State
    private var sfIcon: SFIcon = .init(
        icon: .sfSymbol("list.bullet"),
        iconStyle: .color(.white),
        shape: .circle,
        shapeStyle: .color(.red)
    )

    var body: some View {
        VStack(spacing: 20) {

            SFIconView(sfIcon: sfIcon)
                .fontWeight(.medium)
                .frame(width: 300, height: 300)
                .padding()

            HStack {
                Button {
                    let randomIcon: SFIcon.Icon = [
                        .sfSymbol(Self.DefaultSystemNames.randomElement()!),
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
                        .frame(width: 70, height: 70)
                }
                .buttonStyle(.plain)

                Button {
                    let downloadsDirectory = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
                        .appending(path: UUID().uuidString + ".png")

                    let sfIcon = SFIconView(sfIcon: sfIcon)
                        .fontWeight(.medium)
                        .frame(width: 300, height: 300)

                    guard let sfIconImage = sfIcon.snapshot() else {
                        print("Unable to generate SFIcon image")
                        return
                    }

                    do {
                        try sfIconImage.pngWrite(to: downloadsDirectory, options: [.withoutOverwriting])
                    } catch {
                        print("Unable to save SFIcon image: \(error.localizedDescription)")
                    }
                } label: {
                    Image(systemName: "square.and.arrow.down.fill")
                        .resizable()
                        .padding()
                        .frame(width: 70, height: 70)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
