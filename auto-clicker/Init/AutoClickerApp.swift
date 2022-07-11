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

    @Default(.appearanceSelectedTheme) private var activeTheme

    @StateObject private var permissionsService = PermissionsService()

    var body: some Scene {
        Settings {
            SettingsView()
                .font(.system(size: 16))
        }

        WindowGroup {
            ZStack {
                self.activeTheme.backgroundColour.ignoresSafeArea()

                if self.permissionsService.isTrusted {
                    MainView()
                } else {
                    PermissionsView()
                }
            }
            .frame(minWidth: WindowStateService.width, minHeight: WindowStateService.height)
            .frame(maxWidth: WindowStateService.width, maxHeight: WindowStateService.height)
            .onAppear(perform: self.permissionsService.pollAccessibilityPrivileges)
        }
        .windowStyle(.hiddenTitleBar)
        .commands {
            HelpCommands()
        }
    }
}
