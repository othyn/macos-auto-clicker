//
//  KeyboardShortcutsSettingsTabView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 30/03/2022.
//

import SwiftUI
import KeyboardShortcuts

struct KeyboardShortcutsSettingsTabView: View {
    var body: some View {
        Form {
            // 'init(localized:table:bundle:locale:comment:)' is only available in macOS 12 or newer, so have to use the old way to maintain compatibility!
            KeyboardShortcuts.Recorder(String(format: NSLocalizedString("settings_keyboard_shortcuts_start", comment: "Settings Keyboard Shortcut to Start the auto clicker")), name: .pressStartButton)
            KeyboardShortcuts.Recorder(String(format: NSLocalizedString("settings_keyboard_shortcuts_stop", comment: "Settings Keyboard Shortcut to Stop the auto clicker")), name: .pressStopButton)
        }
    }
}

struct KeyboardShortcutsSettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardShortcutsSettingsTabView()
    }
}
