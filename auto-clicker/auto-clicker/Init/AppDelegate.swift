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
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    
    func applicationWillBecomeActive(_ notification: Notification) {
        WindowStateService.refreshKeepWindowOnTop()
    }
    
    func applicationWillUpdate(_ notification: Notification) {
        if let menu = NSApplication.shared.mainMenu {
            if let file = menu.items.first(where: { $0.title == "File"}) {
                menu.removeItem(file);
            }
            if let edit = menu.items.first(where: { $0.title == "Edit"}) {
                menu.removeItem(edit);
            }
            if let window = menu.items.first(where: { $0.title == "Window"}) {
                menu.removeItem(window);
            }
            if let view = menu.items.first(where: { $0.title == "View"}) {
                menu.removeItem(view);
            }
            if let help = menu.items.first(where: { $0.title == "Help"}) {
                menu.removeItem(help);
            }
        }
    }
}
