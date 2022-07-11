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
        Form {
            // 'init(localized:table:bundle:locale:comment:)' is only available in macOS 12 or newer, so have to use the old way to maintain compatibility!
            Defaults.Toggle(String(format: NSLocalizedString("settings_window_stay_ontop", comment: "Settings Window window should stay ontop toggle")), key: .windowShouldKeepOnTop)
                .onChange { isOn in
                    WindowStateService.toggleKeepWindowOnTop(isOn)
                }
        }
    }
}

struct WindowSettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        WindowSettingsTabView()
    }
}
