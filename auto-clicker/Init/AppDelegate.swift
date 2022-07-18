//
//  AppDelegate.swift
//  auto-clicker
//
//  Created by Ben Tindall on 30/03/2022.
//

import Foundation
import Cocoa
import Defaults

final class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {
    func applicationWillFinishLaunching(_ notification: Notification) {
        WindowStateService.refreshDockIconState()
    }

    func applicationDidFinishLaunching(_ notification: Notification) {
        NSApp.activate(ignoringOtherApps: true)

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
            hideOrShowMenuItem.title = NSLocalizedString("menu_bar_item_hide_show_show", comment: "Menu bar item show option")
                + " "
                + NSLocalizedString("menu_bar_item_hide_show_suffix", comment: "Menu bar item show/hide option suffix")
        }
    }

    func applicationDidUnhide(_ notification: Notification) {
        if let hideOrShowMenuItem = MenuBarService.hideOrShowMenuItem {
            hideOrShowMenuItem.title = NSLocalizedString("menu_bar_item_hide_show_hide", comment: "Menu bar item hide option")
                + " "
                + NSLocalizedString("menu_bar_item_hide_show_suffix", comment: "Menu bar item show/hide option suffix")
        }
    }

    // Hacky workaround in SwiftUI in order to have macOS persist the window size state
    // https://stackoverflow.com/a/72558375/4494375
    func windowShouldClose(_ sender: NSWindow) -> Bool {
        if !Defaults[.appShouldQuitOnClose] {
            NSApp.hide(nil)
            return false
        }

        return true
    }
}
