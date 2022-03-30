//
//  StopwatchButtonStyle.swift
//  auto-clicker
//
//  Created by Ben Tindall on 26/02/2022.
//

import SwiftUI
import Defaults

struct StopwatchButtonStyle: ButtonStyle {
    
    var fontSize: CGFloat = 24
    
    func makeBody(configuration: Self.Configuration) -> some View {
        SuperAmazingButton(configuration: configuration, fontSize: self.fontSize)
    }

    struct SuperAmazingButton: View {
        let configuration: ButtonStyle.Configuration
        
        @Default(.appearanceSelectedTheme) var activeTheme

        @Environment(\.isEnabled) private var isEnabled: Bool
        
        @State private var isHover = false
        
        let fontSize: CGFloat

        var body: some View {
            configuration.label
                .frame(width: 100, height: 45)
                .foregroundColor(isEnabled ? self.activeTheme.fontColour : self.activeTheme.backgroundColour.darker)
                .padding(.horizontal)
                .padding(.bottom, 1)
                .font(.system(size: self.fontSize))
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(isEnabled ? isHover ? self.activeTheme.backgroundColour.lighter : self.activeTheme.backgroundColour.darker : self.activeTheme.backgroundColour)
                )
                .animation(.easeOut)
                .onHover(perform: { hover in
                    isHover = hover
                })
        }
    }
}
