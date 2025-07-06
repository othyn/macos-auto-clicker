//
//  KeyboardShortcutsSettingsTabView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 30/03/2022.
//

import SwiftUI
import KeyboardShortcuts
import Defaults

struct KeyboardShortcutsSettingsTabView: View {
    @Default(.mouseStartOnMove) private var mouseStartOnMove

    var body: some View {
        SettingsTabView {
            SettingsTabItemView(
                title: "settings_keyboard_shortcuts_title",
                help: "settings_keyboard_shortcuts_help",
                divider: true
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

            SettingsTabItemView(
                title: "settings_mouse_movement_title",
                help: "settings_mouse_movement_help"
            ) {
                Defaults.Toggle(
                    " " + String(format: NSLocalizedString("settings_mouse_movement_start_on_move", comment: "Start auto clicker when mouse moves toggle")),
                    key: .mouseStartOnMove
                )

                Defaults.Toggle(
                    " " + String(format: NSLocalizedString("settings_mouse_movement_stop_on_move", comment: "Stop auto clicker when mouse moves toggle")),
                    key: .mouseStopOnMove
                )
            }

            SettingsTabItemView(
                title: "settings_mouse_movement_threshold_title",
                help: "settings_mouse_movement_threshold_help"
            ) {
                HStack(alignment: .top) {
                    NumberField(
                        text: "",
                        min: MIN_MOUSE_MOVEMENT_THRESHOLD,
                        max: MAX_MOUSE_MOVEMENT_THRESHOLD,
                        number: Binding(
                            get: { Defaults[.mouseDeltaThreshold] },
                            set: { Defaults[.mouseDeltaThreshold] = $0 }
                        )
                    )

                    Text("settings_mouse_movement_threshold_pixels")
                        .padding(.leading, 4)
                }.frame(width: 150)
            }
        }
        .onChange(of: mouseStartOnMove) { newValue in
            if newValue {
                AutoClickSimulator.shared.startMouseStartMonitoring()
            } else {
                AutoClickSimulator.shared.stopMouseStartMonitoring()
            }
        }
    }
}

struct KeyboardShortcutsSettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardShortcutsSettingsTabView()
    }
}
