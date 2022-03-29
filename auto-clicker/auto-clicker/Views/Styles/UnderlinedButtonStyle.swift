//
//  UnderlinedButtonStyle.swift
//  auto-clicker
//
//  Created by Ben Tindall on 27/03/2022.
//

import SwiftUI

struct UnderlinedButtonStyle: ButtonStyle {
    
    @Environment(\.isEnabled) private var isEnabled: Bool
    
    @EnvironmentObject var themeService: ThemeService
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .buttonStyle(.plain)
            .foregroundColor(isEnabled ? self.themeService.active.fontColour : self.themeService.active.backgroundColour.darker)
            .opacity(isEnabled ? 1 : 0.5) // Mimics/colour matches the default SwiftUI TextField disabled state opacity that I cannot override
            .overlay(UnderlinedStyleDivider())
    }
}
