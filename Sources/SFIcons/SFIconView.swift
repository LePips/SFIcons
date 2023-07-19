import SwiftUI

public struct SFIconView: View {

    private let sfIcon: SFIcon

    public init(sfIcon: SFIcon) {
        self.sfIcon = sfIcon
    }

    @ViewBuilder
    private var shapeView: any View {
        sfIcon
            .shape
            .swiftUIShape
            .foregroundStyle(sfIcon.shapeStyle.swiftUIStyle)
    }

    @ViewBuilder
    private func emojiView(_ string: String, proxy: GeometryProxy) -> some View {
        Text(string)
            .font(
                .system(
                    size: proxy.size.height > proxy.size.width ? proxy.size.width * 0.55 : proxy.size.height * 0.55
                )
            )
            .lineLimit(1)
    }

    @ViewBuilder
    private func symbolView(_ systemName: String, proxy: GeometryProxy) -> some View {
        Image(systemName: systemName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: proxy.size.width * 0.6, height: proxy.size.height * 0.6, alignment: .center)
            .foregroundStyle(sfIcon.iconStyle.swiftUIStyle)
            .eraseToAnyView()
    }

    public var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .center) {

                shapeView
                    .eraseToAnyView()

                switch sfIcon.icon {
                case let .string(string):
                    emojiView(string, proxy: proxy)
                case let .sfSymbol(systemName):
                    symbolView(systemName, proxy: proxy)
                }
            }
        }
    }
}
