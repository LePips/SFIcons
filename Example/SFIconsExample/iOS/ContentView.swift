import SFIcons
import SwiftUI
import UIKit

public struct ContentView: View {

    @Environment(\.colorScheme)
    private var colorScheme

    @FocusState
    private var isEmojiFieldFocused: Bool

    @State
    private var emojiFieldText: String = ""
    @State
    private var selectedIcon: SFIcon.Icon = .sfSymbol("list.bullet")
    @State
    private var selectedIconStyle: SFIcon.Style = .color(.white)
    @State
    private var selectedShapeStyle: SFIcon.Style = .color(.red)
    @State
    private var selectedShape: SFIcon.Shape = .circle
    @State
    private var selectedStyleModifer: Int = 0
    @State
    private var sfIcon: SFIcon = .init(
        icon: .sfSymbol("list.bullet"),
        iconStyle: .color(.white),
        shape: .circle,
        shapeStyle: .color(.red)
    )

    @ViewBuilder
    private var iconRenderSection: some View {
        Section {
            HStack {
                Spacer()

                SFIconView(sfIcon: sfIcon)
                    .frame(width: 100, height: 100)
                    .fontWeight(.medium)

                Spacer()
            }
        }
    }

    @ViewBuilder
    private var shapeSection: some View {
        Section("Shape") {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))], alignment: .leading) {

                ZStack {
                    Circle()
                        .strokeBorder(
                            .secondary,
                            lineWidth: selectedShape == .circle ? 3 : 0
                        )
                        .frame(width: 50, height: 50)

                    Circle()
                        .fill(.quaternary)
                        .frame(width: 38, height: 38)

                    Circle()
                        .foregroundStyle(colorScheme == .light ? .black : .white)
                        .frame(width: 25, height: 25)
                }
                .onTapGesture {
                    withAnimation(.linear(duration: 0.1)) {
                        selectedShape = .circle
                    }
                }

                ZStack {
                    Circle()
                        .strokeBorder(
                            .secondary,
                            lineWidth: selectedShape.isSameCase(.roundedRectangle(cornerRadius: 0)) ? 3 : 0
                        )
                        .frame(width: 50, height: 50)

                    Circle()
                        .fill(.quaternary)
                        .frame(width: 38, height: 38)

                    RoundedRectangle(cornerRadius: 6)
                        .foregroundStyle(colorScheme == .light ? .black : .white)
                        .frame(width: 25, height: 25)
                }
                .onTapGesture {
                    withAnimation(.linear(duration: 0.1)) {
                        selectedShape = .roundedRectangle(cornerRadius: 20)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var styleSection: some View {
        Section("Style") {
            Picker(selection: $selectedStyleModifer) {
                Text("Shape")
                    .tag(0)

                Text("Icon")
                    .tag(1)
            } label: {
                EmptyView()
            }
            .pickerStyle(.segmented)

            if selectedStyleModifer == 0 {
                shapeStyleSection
            } else {
                iconStyleSection
            }
        }
    }

    @ViewBuilder
    private var shapeStyleSection: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))], alignment: .leading) {
            ForEach(Self.DefaultStyles, id: \.self) { color in
                Circle()
                    .strokeBorder(.secondary, lineWidth: selectedShapeStyle == color ? 3 : 0)
                    .background(
                        Circle()
                            .fill(color.swiftUIStyle)
                            .eraseToAnyView()
                            .frame(width: 38, height: 38)
                    )
                    .frame(width: 50, height: 50)
                    .onTapGesture {
                        withAnimation(.linear(duration: 0.1)) {
                            selectedShapeStyle = color
                        }
                    }
            }
        }
    }

    @ViewBuilder
    private var iconStyleSection: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))], alignment: .leading) {
            ForEach(Self.DefaultStyles, id: \.self) { color in
                Circle()
                    .strokeBorder(.secondary, lineWidth: selectedIconStyle == color ? 3 : 0)
                    .background(
                        Circle()
                            .fill(color.swiftUIStyle)
                            .eraseToAnyView()
                            .frame(width: 38, height: 38)
                    )
                    .frame(width: 50, height: 50)
                    .onTapGesture {
                        withAnimation(.linear(duration: 0.1)) {
                            selectedIconStyle = color
                        }
                    }
            }
        }
    }

    @ViewBuilder
    private var iconSection: some View {
        Section("Icon") {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))], alignment: .leading) {

                ZStack {
                    Circle()
                        .strokeBorder(
                            .secondary,
                            lineWidth: (selectedIcon.isSameCase(.string("a")) || isEmojiFieldFocused) ? 3 : 0
                        )
                        .frame(width: 50, height: 50)

                    Circle()
                        .fill(.blue)
                        .opacity(0.5)
                        .frame(width: 38, height: 38)

                    Image(systemName: "face.smiling")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.blue)
                        .fontWeight(.heavy)
                        .frame(width: 25, height: 25)
                }
                .onTapGesture {
                    guard !isEmojiFieldFocused else { return }

                    isEmojiFieldFocused = true
                }

                ForEach(Self.DefaultSystemNames, id: \.self) { systemName in
                    ZStack {
                        Circle()
                            .strokeBorder(
                                .secondary,
                                lineWidth: (selectedIcon == .sfSymbol(systemName) && !isEmojiFieldFocused) ? 3 : 0
                            )
                            .frame(width: 50, height: 50)

                        Circle()
                            .fill(.quaternary)
                            .frame(width: 38, height: 38)

                        Image(systemName: systemName)
                            .foregroundStyle(colorScheme == .light ? .black : .white)
                            .fontWeight(.heavy)
                    }
                    .onTapGesture {
                        isEmojiFieldFocused = false

                        withAnimation(.linear(duration: 0.1)) {
                            selectedIcon = .sfSymbol(systemName)
                        }
                    }
                }
            }
        }
    }

    public var body: some View {
        NavigationStack {
            ScrollViewReader { proxy in
                ZStack {

                    SFIconEmojiTextField(text: $emojiFieldText)
                        .allowsHitTesting(false)
                        .focused($isEmojiFieldFocused)
                        .opacity(0)

                    List {

                        iconRenderSection
                            .id("iconRenderSection")

                        shapeSection

                        styleSection

                        iconSection
                    }
                }
                .onChange(of: isEmojiFieldFocused) { newValue in
                    guard newValue else { return }
                    withAnimation(.linear(duration: 0.2)) {
                        proxy.scrollTo("iconRenderSection")
                    }
                }
            }
            .navigationTitle("SFIcon")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {

                        isEmojiFieldFocused = false

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
                            selectedIcon = randomIcon
                            selectedIconStyle = randomIconStyle
                            selectedShape = randomShape
                            selectedShapeStyle = randomShapeStyle
                        }
                    } label: {
                        Image(systemName: "dice.fill")
                    }
                }
            }
        }
        .onChange(of: emojiFieldText) { newValue in

            guard !newValue.isEmpty else { return }

            // single emoji character
            if newValue.isSingleEmoji, let emoji = newValue.first {
                selectedIcon = .string(String(emoji))
                isEmojiFieldFocused = false
            } else {
                // up to 2 characters

                selectedIcon = .string(newValue)

                if newValue.count == 2 {
                    isEmojiFieldFocused = false
                }
            }
        }
        .onChange(of: selectedIcon) { newValue in
            sfIcon = .init(
                icon: newValue,
                iconStyle: selectedIconStyle,
                shape: selectedShape,
                shapeStyle: selectedShapeStyle
            )
        }
        .onChange(of: selectedIconStyle) { newValue in
            sfIcon = .init(
                icon: selectedIcon,
                iconStyle: newValue,
                shape: selectedShape,
                shapeStyle: selectedShapeStyle
            )
        }
        .onChange(of: selectedShapeStyle) { newValue in
            sfIcon = .init(
                icon: selectedIcon,
                iconStyle: selectedIconStyle,
                shape: selectedShape,
                shapeStyle: newValue
            )
        }
        .onChange(of: selectedShape) { newValue in
            sfIcon = .init(
                icon: selectedIcon,
                iconStyle: selectedIconStyle,
                shape: newValue,
                shapeStyle: selectedShapeStyle
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
