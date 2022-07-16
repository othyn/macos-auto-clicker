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

        WindowGroup {
            ACWindow()
                .frame(minWidth: WindowStateService.minWidth,
                       maxWidth: WindowStateService.minWidth * WindowStateService.maxDimensionMultiplier,
                       minHeight: WindowStateService.minHeight,
                       maxHeight: WindowStateService.minHeight)
        }
        .windowStyle(.hiddenTitleBar)
        .commands {
            HelpCommands()
        }
    }
}
