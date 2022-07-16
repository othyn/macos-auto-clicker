//
//  WindowSettingsTabView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 30/03/2022.
//

import SwiftUI
import Defaults

struct WindowSettingsTabView: View {
    var body: some View {
        SettingsTabView {
            SettingsTabItemView(
                title: "settings_window_stay_ontop_title",
                help: "settings_window_stay_ontop_help"
            ) {
                Defaults.Toggle(
                    " " + String(format: NSLocalizedString("settings_window_stay_ontop", comment: "Settings Window window should stay ontop toggle")),
                    key: .windowShouldKeepOnTop
                )
                .onChange { isOn in
                    WindowStateService.toggleKeepWindowOnTop(isOn)
                }
            }
        }
    }
}

struct WindowSettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        WindowSettingsTabView()
    }
}
