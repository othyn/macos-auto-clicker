//
//  StopwatchButtonStyle.swift
//  auto-clicker
//
//  Created by Ben Tindall on 26/02/2022.
//

import SwiftUI

struct StopwatchButtonStyle: ButtonStyle {
    
//    var type: Style
//
//    enum Style {
//        case Start, Stop
//
//        func colour() -> Color {
//            switch self {
//            case .Start:
//                return Color(.sRGB, red: 139/255, green: 198/255, blue: 60/255, opacity: 1.0)
//            case .Stop:
//                return Color(.sRGB, red: 239/255, green: 53/255, blue: 65/255, opacity: 1.0)
//            }
//        }
//    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
//        SuperAmazingButton(configuration: configuration, accentColour: type.colour())
        SuperAmazingButton(configuration: configuration)
    }

    struct SuperAmazingButton: View {
        let configuration: ButtonStyle.Configuration
        
        @EnvironmentObject var themeService: ThemeService
        
//        let accentColour: Color

        @Environment(\.isEnabled) private var isEnabled: Bool
        
        @State private var isHover = false

        var body: some View {
            configuration.label
                .frame(width: 100, height: 45)
                .foregroundColor(isEnabled ? self.themeService.active.fontColour : self.themeService.active.backgroundColour.darker)
                .padding(.horizontal)
                .padding(.bottom, 1)
                .font(.system(size: 24))
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(isEnabled ? isHover ? self.themeService.active.backgroundColour.lighter : self.themeService.active.backgroundColour.darker : self.themeService.active.backgroundColour)
                )
                .animation(.easeOut)
                .onHover(perform: { hover in
                    isHover = hover
                })
        }
    }
}
