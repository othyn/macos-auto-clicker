//
//  UnderlinedTextFieldStyle.swift
//  auto-clicker
//
//  Created by Ben Tindall on 27/03/2022.
//

import SwiftUI

struct UnderlinedTextFieldStyle: TextFieldStyle {
    public func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .textFieldStyle(.plain)
            .overlay(UnderlinedStyleDivider())
    }
}
