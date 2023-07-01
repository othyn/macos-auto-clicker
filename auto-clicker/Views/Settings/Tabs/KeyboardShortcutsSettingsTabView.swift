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
        SettingsTabView {
            SettingsTabItemView(
                title: "settings_keyboard_shortcuts_title",
                help: "settings_keyboard_shortcuts_help"
            ) {
                KeyboardShortcuts.Recorder(
                    String(format: NSLocalizedString("settings_keyboard_shortcuts_start", comment: "Settings Keyboard Shortcut to Start the auto clicker")),
                    name: .pressStartButton,
                    onChange: { _ in
                        MenuBarService.refreshState()
                    }
                )

                KeyboardShortcuts.Recorder(
                    String(format: NSLocalizedString("settings_keyboard_shortcuts_stop", comment: "Settings Keyboard Shortcut to Stop the auto clicker")),
                    name: .pressStopButton,
                    onChange: { _ in
                        MenuBarService.refreshState()
                    }
                )
            }
        }
    }
}

struct KeyboardShortcutsSettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardShortcutsSettingsTabView()
    }
}
