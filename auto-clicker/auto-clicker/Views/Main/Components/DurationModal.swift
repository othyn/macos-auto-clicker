//
//  DurationModal.swift
//  auto-clicker
//
//  Created by Ben Tindall on 27/03/2022.
//

import SwiftUI
import Defaults

struct DurationModal: View {
    @Environment(\.presentationMode) var presentationMode

    @Default(.appearanceSelectedTheme) var activeTheme

    @Binding var selected: Duration

    var body: some View {
        VStack {
            ForEach(Duration.allCases) { unit in
                unit.buttonView(action: {
                    self.presentationMode.wrappedValue.dismiss()

                    self.selected = unit
                })
                .buttonStyle(ModalButtonStyle())
            }

            // 'init(_:role:action:)' is only available in macOS 12.0 or newer
            // so cannot use a .destructive theme
            Button("Cancel") {
                self.presentationMode.wrappedValue.dismiss()
            }
            .buttonStyle(ModalButtonStyle(isDestructive: true))
        }
        .frame(width: 200, height: 220)
        .padding(.vertical, 14)
        .padding(.horizontal, 5)
        .background(self.activeTheme.backgroundColour).ignoresSafeArea()
    }
}
