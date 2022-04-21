//
//  ThemedButtonStyle.swift
//  auto-clicker
//
//  Created by Ben Tindall on 26/02/2022.
//

import SwiftUI
import Defaults

struct ThemedButtonStyle: ButtonStyle {
    var fontSize: CGFloat = 24
    var width: CGFloat = 100
    var height: CGFloat = 45

    func makeBody(configuration: Self.Configuration) -> some View {
        SuperAmazingButton(configuration: configuration,
                           fontSize: self.fontSize,
                           width: self.width,
                           height: self.height)
    }

    struct SuperAmazingButton: View {
        let configuration: ButtonStyle.Configuration

        @Default(.appearanceSelectedTheme) private var activeTheme

        @Environment(\.isEnabled) private var isEnabled: Bool

        @State private var isHover = false

        let fontSize: CGFloat
        let width: CGFloat
        let height: CGFloat

        var body: some View {
            configuration.label
                .frame(width: self.width, height: self.height)
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
