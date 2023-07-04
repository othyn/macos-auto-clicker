//
//  MouseMoveModal.swift
//  auto-clicker
//
//  Created by Tomasz Pędraszewski on 04/07/2023.
//

import SwiftUI
import Defaults

struct MouseMoveModal: View {
    @Environment(\.presentationMode) private var presentationMode

    @Default(.appearanceSelectedTheme) private var activeTheme

    @Binding var selected: MouseMove

    var body: some View {
        VStack {
            ForEach(MouseMove.allCases) { unit in
                unit.buttonView(action: {
                    self.presentationMode.wrappedValue.dismiss()

                    self.selected = unit
                })
                .buttonStyle(ModalButtonStyle())
            }

            // 'init(_:role:action:)' is only available in macOS 12.0 or newer
            // so cannot use a .destructive theme
            Button("mousemove_modal_cancel_button") {
                self.presentationMode.wrappedValue.dismiss()
            }
            .buttonStyle(ModalButtonStyle(isDestructive: true))
        }
        .frame(width: 200, height: 220)
        .padding(.vertical, 14)
        .padding(.horizontal, 5)
        .background(self.activeTheme.backgroundColour)
        .ignoresSafeArea()
    }
}
