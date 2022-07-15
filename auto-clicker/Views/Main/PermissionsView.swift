//
//  PermissionsView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 10/04/2022.
//

import SwiftUI
import Defaults

struct PermissionsView: View {
    @Default(.appearanceSelectedTheme) private var activeTheme

    func openSystemPreferences() {
        NSWorkspace.shared.open(URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility")!)
    }

    var body: some View {
        VStack {
            Text("permissions_help_title", comment: "Permissions helper splash window title")
                .font(.system(size: 32))
                .padding(.bottom, 25)

            Text("permissions_help_first_paragraph", comment: "Permissions helper splash window description")
                .font(.system(size: 16))
                .multilineTextAlignment(.center)
                .padding(.bottom, 15)

            Text("permissions_help_second_paragraph", comment: "Permissions helper splash window description extended")
                .font(.system(size: 16))
                .multilineTextAlignment(.center)
                .padding(.bottom, 25)

            Button(action: openSystemPreferences) {
                Text("permissions_help_open_sys_pref_btn", comment: "Open system preferences button")
            }
            .buttonStyle(ThemedButtonStyle(fontSize: 16, width: 220))
            .padding(.bottom, 25)

            Text("permissions_help_unlock_note", comment: "Permissions helper splash window unlock note")
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
