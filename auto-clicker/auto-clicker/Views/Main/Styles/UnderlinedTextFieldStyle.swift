//
//  UnderlinedTextFieldStyle.swift
//  auto-clicker
//
//  Created by Ben Tindall on 27/03/2022.
//

import SwiftUI

struct UnderlinedTextFieldStyle: TextFieldStyle {
    
    @Environment(\.isEnabled) private var isEnabled: Bool
    
    @EnvironmentObject var themeService: ThemeService
    
    public func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .textFieldStyle(.plain)
            .foregroundColor(isEnabled ? self.themeService.active.fontColour : self.themeService.active.backgroundColour.darker)
            .overlay(UnderlinedStyleDivider())
    }
}
