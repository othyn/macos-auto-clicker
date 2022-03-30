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
            Defaults.Toggle("Should Stay On Top", key: .windowShouldKeepOnTop)
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
