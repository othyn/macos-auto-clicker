//
//  AutoClickerApp.swift
//  auto-clicker
//
//  Created by Ben Tindall on 12/05/2021.
//

import Foundation
import SwiftUI
import Cocoa

struct WindowSize {
    static let width: CGFloat = 550
    static let height: CGFloat = 430
}

final class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        if let window = NSApplication.shared.windows.first {
            window.titlebarAppearsTransparent = true


            let customToolbar = NSToolbar()
            customToolbar.showsBaselineSeparator = false
            window.toolbar = customToolbar
        }
    }
}

@main
struct AutoClickerApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var themeService = ThemeService()

    var body: some Scene {
        WindowGroup {
            ZStack {
                self.themeService.active.backgroundColour.ignoresSafeArea()
                
                MainView()
            }
            .frame(minWidth: WindowSize.width, minHeight: WindowSize.height)
            .frame(maxWidth: WindowSize.width, maxHeight: WindowSize.height)
            .environmentObject(self.themeService)
        }
        .windowStyle(.hiddenTitleBar)
    }
}
