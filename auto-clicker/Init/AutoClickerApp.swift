//
//  AutoClickerApp.swift
//  auto-clicker
//
//  Created by Ben Tindall on 12/05/2021.
//

import Foundation
import SwiftUI
import Defaults

@main
struct AutoClickerApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        Settings {
            SettingsView()
        }

        WindowGroup("mainWindow") {
            ACWindow()
                .frame(minWidth: WindowStateService.mainWindowMinWidth,
                       maxWidth: WindowStateService.mainWindowMinWidth * WindowStateService.mainWindowMaxDimensionMultiplier,
                       minHeight: WindowStateService.mainWindowMinHeight,
                       maxHeight: WindowStateService.mainWindowMinHeight)
        }
        .handlesExternalEvents(matching: ["mainWindow"])
        .windowStyle(.hiddenTitleBar)
        .commands {
            HelpCommands()
        }
    }
}
