//
//  AppDelegate.swift
//  auto-clicker
//
//  Created by Ben Tindall on 30/03/2022.
//

import Foundation
import Cocoa

final class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        if let window = NSApplication.shared.mainWindow {
            window.titlebarAppearsTransparent = true

            let customToolbar = NSToolbar()
            customToolbar.showsBaselineSeparator = false
            window.toolbar = customToolbar
        }

        PermissionsService.acquireAccessibilityPrivileges()
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        true
    }

    func applicationWillBecomeActive(_ notification: Notification) {
        WindowStateService.refreshKeepWindowOnTop()
    }
}
