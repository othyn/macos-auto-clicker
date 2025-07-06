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
        WindowGroup {
            ACWindow()
                .frame(minWidth: WindowStateService.mainWindowMinWidth,
                       idealWidth: WindowStateService.mainWindowMinWidth,
                       maxWidth: WindowStateService.mainWindowMinWidth * WindowStateService.mainWindowMaxDimensionMultiplier,
                       minHeight: WindowStateService.mainWindowMinHeight,
                       idealHeight: WindowStateService.mainWindowMinHeight,
                       maxHeight: WindowStateService.mainWindowMinHeight)
        }
        .windowStyle(.hiddenTitleBar)
        .windowResizability(.contentSize)
        .commands {
            HelpCommands()

            CommandGroup(replacing: CommandGroupPlacement.appInfo) {
                Button(NSLocalizedString("about_about", comment: "About") + " \(Bundle.main.appName)...") { delegate.showAboutWindow() }
            }
        }

        Settings {
            SettingsView()
        }
    }
}
