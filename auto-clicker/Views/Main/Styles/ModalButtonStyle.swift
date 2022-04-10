//
//  ModalButtonStyle.swift
//  auto-clicker
//
//  Created by Ben Tindall on 27/03/2022.
//

import SwiftUI
import Defaults

struct ModalButtonStyle: ButtonStyle {
    @Default(.appearanceSelectedTheme) var activeTheme

    @State private var isHover = false

    var isDestructive = false

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()

            configuration.label

            Spacer()
        }
        .padding(.all, 10)
        .font(.system(size: 18))
        .foregroundColor(
            self.isHover
            ? self.activeTheme.fontColour
            : self.isDestructive
                ? self.activeTheme.backgroundColour.darker
                : self.activeTheme.fontColour
        )
        .background((
            self.isHover
            ? configuration.isPressed
                ? self.activeTheme.backgroundColour.lighter
                : self.activeTheme.backgroundColour.darker
            : ThemeColour.clear)
            .cornerRadius(8)
        )
        .overlay(
            VStack {
                Divider()
                    .frame(height: 1)
                    .offset(y: 20)
                    .padding(.horizontal, 10)
                    .opacity(self.isHover || self.isDestructive ? 0 : 1)
            }
        )
        .onHover(perform: { hover in
            isHover = hover
        })
    }
}
