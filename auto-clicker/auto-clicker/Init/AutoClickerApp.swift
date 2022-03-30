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

    @Default(.appearanceSelectedTheme) var activeTheme

    var body: some Scene {
        Settings {
            SettingsView()
                .background(self.activeTheme.backgroundColour)
                .foregroundColor(self.activeTheme.fontColour)
                .font(.system(size: 16, weight: .medium))
        }

        WindowGroup {
            ZStack {
                self.activeTheme.backgroundColour.ignoresSafeArea()

                MainView()
            }
            .frame(minWidth: WindowStateService.width, minHeight: WindowStateService.height)
            .frame(maxWidth: WindowStateService.width, maxHeight: WindowStateService.height)
        }
        .windowStyle(.hiddenTitleBar)
//        .commands {
//            OptionsCommands(keepWindowOnTop: self.$keepWindowOnTop)
//        }
    }
}
