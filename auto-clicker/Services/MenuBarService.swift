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

    static var startMenuItem: NSMenuItem?
    static var stopMenuItem: NSMenuItem?
    static var hideOrShowMenuItem: NSMenuItem?
    static var quitMenuItem: NSMenuItem?

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
        menu.autoenablesItems = false

        self.startMenuItem = NSMenuItem(
            title: NSLocalizedString("menu_bar_item_start", comment: "Menu bar item start option"),
            action: #selector(menuActionStart),
            keyEquivalent: KeyboardShortcuts.Name.pressStartButton.shortcut!.descriptionKeyOnly.lowercased()
        )
        self.startMenuItem!.target = self
        menu.addItem(self.startMenuItem!)

        self.stopMenuItem = NSMenuItem(
            title: NSLocalizedString("menu_bar_item_stop", comment: "Menu bar item stop option"),
            action: #selector(menuActionStop),
            keyEquivalent: KeyboardShortcuts.Name.pressStopButton.shortcut!.descriptionKeyOnly.lowercased()
        )
        self.stopMenuItem!.isEnabled = false
        self.stopMenuItem!.target = self
        menu.addItem(self.stopMenuItem!)

        menu.addItem(NSMenuItem.separator())

        self.hideOrShowMenuItem = NSMenuItem(
            title: (NSApp.isHidden
                    ? NSLocalizedString("menu_bar_item_hide_show_show", comment: "Menu bar item show option")
                    : NSLocalizedString("menu_bar_item_hide_show_hide", comment: "Menu bar item hide option"))
                    + " " + NSLocalizedString("menu_bar_item_hide_show_suffix", comment: "Menu bar item show/hide option suffix"),
            action: #selector(menuActionHideOrShow),
            keyEquivalent: ""
        )
        self.hideOrShowMenuItem!.target = self
        menu.addItem(self.hideOrShowMenuItem!)

        menu.addItem(NSMenuItem.separator())

        self.quitMenuItem = NSMenuItem(
            title: NSLocalizedString("menu_bar_item_quit", comment: "Menu bar item quit option"),
            action: #selector(menuActionQuit),
            keyEquivalent: "q"
        )
        self.quitMenuItem!.target = self
        menu.addItem(self.quitMenuItem!)

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
        AutoClickSimulator.shared.start()
    }

    @objc static func menuActionStop(sender: NSMenuItem) {
        AutoClickSimulator.shared.stop()
    }

    @objc static func menuActionHideOrShow(sender: NSMenuItem) {
        if NSApp.isHidden {
            NSApp.unhide(nil)
        } else {
            NSApp.hide(nil)
        }
    }

    @objc static func menuActionQuit(sender: NSMenuItem) {
        NSApp.terminate(self)
    }
}