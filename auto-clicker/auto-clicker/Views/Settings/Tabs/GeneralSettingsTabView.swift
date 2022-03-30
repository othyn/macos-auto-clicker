//
//  GeneralSettingsTabView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 30/03/2022.
//

import SwiftUI
import KeyboardShortcuts

struct GeneralSettingsTabView: View {
    var body: some View {
        Form {
            KeyboardShortcuts.Recorder("Press Start Button:", name: .pressStartButton)
            KeyboardShortcuts.Recorder("Press Stop Button:",  name: .pressStopButton)
        }
    }
}

struct GeneralSettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralSettingsTabView()
    }
}
