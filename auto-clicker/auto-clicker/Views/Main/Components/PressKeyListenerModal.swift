//
//  PressKeyListenerModal.swift
//  auto-clicker
//
//  Created by Ben Tindall on 07/04/2022.
//

import SwiftUI
import Defaults
import Carbon.HIToolbox

private struct SmallText: View {
    var text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(self.text)
            .font(.system(size: 10))
    }
}

struct PressKeyListenerModal: View {
    @Environment(\.presentationMode) var presentationMode

    @Default(.appearanceSelectedTheme) var activeTheme
    @Default(.userSelectedInput) var selectedInput

    @State private var escapeKeyStreak: Int = 0

    func handleInputEvent(input: Input) {
        guard !input.isMouseInput else {
            self.selectedInput = input

            return
        }

        if input.keyCode == kVK_Escape {
            self.escapeKeyStreak += 1
        }

        // Issue is, there is always an initial key press of escape before macOS triggers the repeat flag for holding the key
        if input.keyCode == kVK_Escape && input.isRepeat {
            self.presentationMode.wrappedValue.dismiss()

            return
        }

        if input.keyCode != kVK_Escape || (input.keyCode == kVK_Escape && self.escapeKeyStreak > 1) {
            Defaults[.userSelectedInput] = input

            self.escapeKeyStreak = 0
        }
    }

    var body: some View {
        VStack {
            SmallText("Press your desired input...")

            Spacer()

            Text(self.selectedInput.readable)

            Spacer()

            SmallText("Hold the escape key when done.")
            SmallText("To use the escape key itself, press it twice.")
        }
        .frame(width: 300, height: 150)
        .padding(.vertical, 14)
        .padding(.horizontal, 5)
        .background(self.activeTheme.backgroundColour).ignoresSafeArea()
        .overlay(InputAwareView(onPress: handleInputEvent))
    }
}
