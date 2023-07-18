//
//  SFIconView.swift
//  SFIcons
//

import SwiftUI

struct SFIconView: View {
    
    let sfIcon: SFIcon
    
    @ViewBuilder
    private var shapeView: any View {
        sfIcon
            .shape
            .swiftUIShape
            .foregroundStyle(sfIcon.shapeStyle.swiftUIStyle)
    }
    
    @ViewBuilder
    private func emojiView(_ string: String, proxy g: GeometryProxy) -> some View {
        Text(string)
            .font(.system(
                size: g.size.height > g.size.width ? g.size.width * 0.55 : g.size.height * 0.55)
            )
            .lineLimit(1)
    }
    
    @ViewBuilder
    private func symbolView(_ systemName: String, proxy g: GeometryProxy) -> some View {
        Image(systemName: systemName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: g.size.width * 0.6, height: g.size.height * 0.6, alignment: .center)
            .foregroundStyle(sfIcon.iconStyle.swiftUIStyle)
            .eraseToAnyView()
    }
    
    var body: some View {
        GeometryReader { g in
            ZStack(alignment: .center) {
                
                shapeView
                    .eraseToAnyView()
                    .shadow(radius: 10)
                
                switch sfIcon.icon {
                case .string(let string):
                    emojiView(string, proxy: g)
                case .sfSymbol(let systemName):
                    symbolView(systemName, proxy: g)
                }
            }
        }
    }
}

struct SFIconPreview: View {
    
    @State
    private var iconWidth: CGFloat = 150
    
    private let icon = SFIcon(
        icon: .string("😤"),
        iconStyle: .color(.red),
        shape: .circle,
        shapeStyle: .angularGradient(
            colors: [.red, .orange, .yellow, .green, .blue, .purple, .red],
            center: .center,
            startAngle: .zero,
            endAngle: Angle(degrees: 360)
        )
    )
    
    var body: some View {
        VStack {
            Spacer()
            
            SFIconView(sfIcon: icon)
                .frame(width: iconWidth, height: iconWidth)
            
            Spacer()
            
            Slider(value: $iconWidth, in: 50 ... 300)
                .padding()
        }
    }
}

#Preview {
    SFIconPreview()
}
