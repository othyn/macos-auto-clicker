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

    @Default(.windowSize) private var windowSize

    var body: some Scene {
        Settings {
            SettingsView()
                .font(.system(size: 16))
        }

        WindowGroup {
            GeometryReader { geometry in
                ACWindow()
                    .onChange(of: geometry.size) { newSize in
                        self.windowSize.dx = newSize.width
                        print(self.windowSize)
                    }
            }
            .frame(minWidth: WindowStateService.minWidth,
                   idealWidth: self.windowSize.dx,
                   minHeight: WindowStateService.minHeight,
                   maxHeight: WindowStateService.minHeight)
        }
        .windowStyle(.hiddenTitleBar)
        .commands {
            HelpCommands()
        }
    }
}
