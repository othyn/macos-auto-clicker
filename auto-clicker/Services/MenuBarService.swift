//
//  MenuBarService.swift
//  auto-clicker
//
//  Created by Ben Tindall on 16/07/2022.
//

import Foundation
import Cocoa
import Defaults
import SwiftUI
import KeyboardShortcuts

// Good references:
// - https://khorbushko.github.io/article/2021/04/30/minimal-macOS-menu-bar-extra%27s-app-with-SwiftUI.html
// - https://github.com/kyan/kyan_bar/blob/master/KyanBar/MainMenu.swift
// - https://github.com/AnaghSharma/Ambar-SwiftUI/blob/master/Ambar/AppDelegate.swift
// - https://github.com/AnaghSharma/Ambar-SwiftUI/blob/master/Ambar/Helpers/StatusBarController.swift
// - https://stackoverflow.com/q/64816192/4494375
// - Annoyingly in Ventura/iOS 16 you can now just use the SwiftUI native MenuBarExtras method like WindowGroup and Settings in
//    the App, so in AutoClickerApp!

final class MenuBarService {
    static var statusBar: NSStatusBar?
    static var statusBarItem: NSStatusItem?
    static var statusBarPopover: NSPopover?

    static func create() {
        self.statusBar = NSStatusBar.system
        self.statusBarItem = self.statusBar!.statusItem(withLength: NSStatusItem.variableLength)
        self.statusBarPopover = NSPopover()

        if let statusBarButton = self.statusBarItem!.button {
            statusBarButton.image = NSImage(systemSymbolName: "cursorarrow.click.badge.clock", accessibilityDescription: "auto clicker")
            statusBarButton.action = #selector(togglePopover(sender:))
            statusBarButton.target = self
        }

//        Styling just didn't really work, this would work well for a Menu Bar app, but not for just simple clickable Menu Items...
//        self.statusBarPopover!.contentSize = NSSize(width: WindowStateService.menuBarWidth, height: WindowStateService.menuBarHeight)
//        self.statusBarPopover!.behavior = .transient
//        self.statusBarPopover!.contentViewController = NSHostingController(rootView: MenuBarView())

        self.statusBarItem!.menu = self.buildMenu()
    }

    private static func buildMenu() -> NSMenu {
        let menu = NSMenu()

        let startMenuItem = NSMenuItem(
          title: "Start",
          action: #selector(menuActionStart),
          keyEquivalent: KeyboardShortcuts.Name.pressStartButton.shortcut!.descriptionKeyOnly.lowercased()
        )
        startMenuItem.target = self
        menu.addItem(startMenuItem)

        let stopMenuItem = NSMenuItem(
          title: "Stop",
          action: #selector(menuActionStop),
          keyEquivalent: KeyboardShortcuts.Name.pressStopButton.shortcut!.descriptionKeyOnly.lowercased()
        )
        stopMenuItem.target = self
        menu.addItem(stopMenuItem)

        menu.addItem(NSMenuItem.separator())

        let showMenuItem = NSMenuItem(
          title: "Show App",
          action: #selector(menuActionShow),
          keyEquivalent: ""
        )
        showMenuItem.target = self
        menu.addItem(showMenuItem)

        menu.addItem(NSMenuItem.separator())

        let quitMenuItem = NSMenuItem(
          title: "Quit",
          action: #selector(menuActionQuit),
          keyEquivalent: "q"
        )
        quitMenuItem.target = self
        menu.addItem(quitMenuItem)

        return menu
    }

    static func destroy() {
        self.statusBar = nil
        self.statusBarItem = nil
        self.statusBarPopover = nil
    }

    static func toggle(_ isEnabled: Bool) {
        if isEnabled {
            self.create()
        } else {
            self.destroy()
        }
    }

    static func refreshState() {
        self.toggle(Defaults[.menuBarShowIcon])
    }

    @objc static func togglePopover(sender: AnyObject) {
        if self.statusBarPopover!.isShown {
            self.hidePopover(sender)
        } else {
            self.showPopover(sender)
        }
    }

    static func showPopover(_ sender: AnyObject) {
        if let statusBarButton = self.statusBarItem!.button {
            self.statusBarPopover!.show(relativeTo: statusBarButton.bounds, of: statusBarButton, preferredEdge: .minY)
        }
    }

    static func hidePopover(_ sender: AnyObject) {
        self.statusBarPopover!.performClose(sender)
    }

    @objc static func menuActionStart(sender: NSMenuItem) {
        print("start")
    }

    @objc static func menuActionStop(sender: NSMenuItem) {
        print("stop")
    }

    @objc static func menuActionShow(sender: NSMenuItem) {
        // Err... nearly! This implementation opens a new main window each time...
        // NSWorkspace.shared.open(URL(string: "auto-clicker://mainWindow"))

        print(NSApplication.shared.windows)

        if let window = NSApplication.shared.mainWindow {
            print("Menu Bar: menuActionShow pressed")
            window.makeKeyAndOrderFront(nil)
            print(window.isVisible)
            print(window.isMiniaturized)
        }
    }

    @objc static func menuActionQuit(sender: NSMenuItem) {
        NSApp.terminate(self)
    }
}
