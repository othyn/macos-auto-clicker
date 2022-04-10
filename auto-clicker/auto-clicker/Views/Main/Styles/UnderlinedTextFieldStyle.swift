//
//  UnderlinedTextFieldStyle.swift
//  auto-clicker
//
//  Created by Ben Tindall on 27/03/2022.
//

import SwiftUI
import Defaults

struct UnderlinedTextFieldStyle: TextFieldStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool

    @Default(.appearanceSelectedTheme) var activeTheme

    // swiftlint:disable:next identifier_name
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .textFieldStyle(.plain)
            .foregroundColor(isEnabled ? self.activeTheme.fontColour : self.activeTheme.backgroundColour.darker)
            .overlay(UnderlinedStyleDivider())
    }
}
