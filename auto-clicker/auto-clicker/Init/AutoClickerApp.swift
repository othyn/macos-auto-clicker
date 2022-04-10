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

    @State private var isTrusted = AXIsProcessTrusted()

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

                if self.isTrusted {
                    MainView()
                } else {
                    PermissionsView()
                }
            }
            .frame(minWidth: WindowStateService.width, minHeight: WindowStateService.height)
            .frame(maxWidth: WindowStateService.width, maxHeight: WindowStateService.height)
            .onAppear {
                PermissionsService.pollAccessibilityPrivileges(onPermitted: { self.isTrusted = true },
                                                               onDenied: { self.isTrusted = false })
            }
        }
        .windowStyle(.hiddenTitleBar)
//        .commands {
//            OptionsCommands(keepWindowOnTop: self.$keepWindowOnTop)
//        }
    }
}
