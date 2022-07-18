//
//  AppDelegate.swift
//  auto-clicker
//
//  Created by Ben Tindall on 30/03/2022.
//

import Foundation
import Cocoa

final class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        if let window = NSApplication.shared.mainWindow {
            window.titlebarAppearsTransparent = true

            let customToolbar = NSToolbar()
            customToolbar.showsBaselineSeparator = false
            window.toolbar = customToolbar
        }

        // Hacky workaround in SwiftUI in order to have macOS persist the window size state
        // https://stackoverflow.com/a/72558375/4494375
        NSApp.windows[0].delegate = self

        MenuBarService.refreshState()

        PermissionsService.acquireAccessibilityPrivileges()
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        WindowStateService.shouldExitOnClose()
    }

    func applicationWillBecomeActive(_ notification: Notification) {
        WindowStateService.refreshKeepWindowOnTop()
    }

    func applicationDidHide(_ notification: Notification) {
        if let hideOrShowMenuItem = MenuBarService.hideOrShowMenuItem {
            hideOrShowMenuItem.title = "Show App"
        }
    }

    func applicationDidUnhide(_ notification: Notification) {
        if let hideOrShowMenuItem = MenuBarService.hideOrShowMenuItem {
            hideOrShowMenuItem.title = "Hide App"
        }
    }

    // Hacky workaround in SwiftUI in order to have macOS persist the window size state
    // https://stackoverflow.com/a/72558375/4494375
    func windowShouldClose(_ sender: NSWindow) -> Bool {
        NSApp.hide(nil)

        return false
    }
}
