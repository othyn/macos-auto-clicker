//
//  UnderlinedButtonStyle.swift
//  auto-clicker
//
//  Created by Ben Tindall on 27/03/2022.
//

import SwiftUI

struct UnderlinedButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .buttonStyle(.plain)
            .overlay(UnderlinedStyleDivider())
    }
}
