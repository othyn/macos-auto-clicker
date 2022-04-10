//
//  PermissionsView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 10/04/2022.
//

import SwiftUI
import Defaults

struct PermissionsView: View {
    @Default(.appearanceSelectedTheme) var activeTheme

    func openSystemPreferences() {
        NSWorkspace.shared.open(URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility")!)
    }

    var body: some View {
        VStack {
            Text("Permissions Required 🔐")
                .font(.system(size: 32))
                .padding(.bottom, 25)

            Text("macOS requires that this app has accessibility permissions granted to it in order to press the specified keys or buttons.")
                .font(.system(size: 16))
                .multilineTextAlignment(.center)
                .padding(.bottom, 15)

            Text("You should have already been prompted by macOS to grant these permissions but if not, here's a handy button to get you there:")
                .font(.system(size: 16))
                .multilineTextAlignment(.center)
                .padding(.bottom, 25)

            Button("Open System Preferences", action: openSystemPreferences)
                .buttonStyle(ThemedButtonStyle(fontSize: 16, width: 220))
                .padding(.bottom, 25)

            Text("The app will automatically unlock within a few seconds of the permission being granted.")
                .font(.system(size: 12))
                .multilineTextAlignment(.center)
        }
        .foregroundColor(self.activeTheme.fontColour)
        .padding(.horizontal, 35)
    }
}

struct PermissionsView_Previews: PreviewProvider {
    static var previews: some View {
        PermissionsView()
    }
}
