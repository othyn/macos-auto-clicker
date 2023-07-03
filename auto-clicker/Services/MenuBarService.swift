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
    static var preferencesMenuItem: NSMenuItem?
    static var aboutMenuItem: NSMenuItem?
    static var quitMenuItem: NSMenuItem?

    static func create() {
        self.statusBar = NSStatusBar.system
        self.statusBarItem = self.statusBar!.statusItem(withLength: NSStatusItem.variableLength)
        self.statusBarPopover = NSPopover()

        if let statusBarButton = self.statusBarItem!.button {
            self.resetImage()

            statusBarButton.action = #selector(togglePopover(sender:))
            statusBarButton.target = self
        }

//        Styling just didn't really work, this would work well for a Menu Bar app, but not for just simple clickable Menu Items...
//        self.statusBarPopover!.contentSize = NSSize(width: WindowStateService.menuBarWidth, height: WindowStateService.menuBarHeight)
//        self.statusBarPopover!.behavior = .transient
//        self.statusBarPopover!.contentViewController = NSHostingController(rootView: MenuBarView())

        self.statusBarItem!.menu = self.buildMenu()

        // Set default state of disabled if the application is waiting for permissions trust
        if !PermissionsService.shared.isTrusted {
            self.disableAllMenuBarItems()
        }
    }

    private static func buildMenu() -> NSMenu {
        let menu = NSMenu()
        menu.autoenablesItems = false

        self.startMenuItem = NSMenuItem(
            title: NSLocalizedString("menu_bar_item_start", comment: "Menu bar item start option"),
            action: #selector(menuActionStart),
            keyEquivalent: KeyboardShortcuts.Name.pressStartButton.shortcut?.descriptionKeyOnly.lowercased() ?? ""
        )
        self.startMenuItem!.target = self
        menu.addItem(self.startMenuItem!)

        self.stopMenuItem = NSMenuItem(
            title: NSLocalizedString("menu_bar_item_stop", comment: "Menu bar item stop option"),
            action: #selector(menuActionStop),
            keyEquivalent: KeyboardShortcuts.Name.pressStopButton.shortcut?.descriptionKeyOnly.lowercased() ?? ""
        )
        self.stopMenuItem!.isEnabled = false
        self.stopMenuItem!.target = self
        menu.addItem(self.stopMenuItem!)

        menu.addItem(NSMenuItem.separator())

        self.hideOrShowMenuItem = NSMenuItem(
            title: (NSApp.isHidden
                    ? NSLocalizedString("menu_bar_item_hide_show_show", comment: "Menu bar item show option")
                    : NSLocalizedString("menu_bar_item_hide_show_hide", comment: "Menu bar item hide option")),
            action: #selector(menuActionHideOrShow),
            keyEquivalent: "h"
        )
        self.hideOrShowMenuItem!.target = self
        menu.addItem(self.hideOrShowMenuItem!)

        menu.addItem(NSMenuItem.separator())

        self.preferencesMenuItem = NSMenuItem(
            title: NSLocalizedString("menu_bar_item_preferences", comment: "Menu bar item preferences option"),
            action: #selector(self.menuActionPreferences),
            keyEquivalent: ","
        )
        self.preferencesMenuItem!.target = self
        menu.addItem(self.preferencesMenuItem!)

        self.aboutMenuItem = NSMenuItem(
            title: NSLocalizedString("menu_bar_item_about", comment: "Menu bar item about option"),
            action: #selector(self.menuActionAbout),
            keyEquivalent: ""
        )
        self.aboutMenuItem!.target = self
        menu.addItem(self.aboutMenuItem!)

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

    /*
     * I've spent about 2 hours trying to find out how to reset the menu bar colour back to the system default for the
     *  current colour scheme and/or background wallpaper. In typical Apple docs fashion, this just doesn't appear to
     *  be a thing, so I have no idea how we can actually reset or follow the system.
     * If we just create and use a new SymbolConfiguration(), it defaults to blue.
     * I've also had a look through the code, and there appears to be no way to simply retain or read the existing
     *  configuration colour. We could re-apply it, but then we need to persist and store it. This appears to be the
     *  simplest method for now, there is no documentation on this what-so-ever.
     * The only other way would be something manual like this: https://stackoverflow.com/a/66984289/4494375
     * NOTE: This is still not perfect. On Dark mode/Dark triggering wallpapers, Color.primary resolves to the correct
     *  dark colour. However, on Light mode/Light triggering wallpapers, Color.primary resolves to the incorrect light
     *  colour that is a dullish grey.
     *  The issue is, on Dark/Light mode the wallpaper will trigger an override to the default colour, so doing an
     *   AppleInterfaceStyle check does nothing, as one display could be using light mode and the other using dark
     *   making a check useless.
     * I feel although I'm missing something, but between hours scouring documentation, search engines and ChatGPT,
     *  nothing is coming up.
     */
    static func resetImage() {
        if let statusBarButton = self.statusBarItem!.button {
            statusBarButton.image = NSImage(systemSymbolName: "cursorarrow.click.badge.clock", accessibilityDescription: "auto clicker")
        }
    }

    static func changeImageColour(newColor: NSColor) {
        // let mode = UserDefaults.standard.string(forKey: "AppleInterfaceStyle")
        // let primaryColour = mode == "Dark" ? Color.primary : Color.white

        if Defaults[.menuBarShowDynamicIcon],
           let statusBarButton = self.statusBarItem?.button {
            statusBarButton.image = statusBarButton.image!.withSymbolConfiguration(
                NSImage.SymbolConfiguration(paletteColors: [NSColor(Color.primary), newColor])
            )
        }
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

    static func disableAllMenuBarItems() {
        if let startMenuItem = self.startMenuItem {
            startMenuItem.isEnabled = false
        }

        if let stopMenuItem = self.stopMenuItem {
            stopMenuItem.isEnabled = false
        }

        if let hideOrShowMenuItem = self.hideOrShowMenuItem {
            hideOrShowMenuItem.isEnabled = false
        }

        if let preferencesMenuItem = self.preferencesMenuItem {
            preferencesMenuItem.isEnabled = false
        }

        // Intentional, the about option should always be enabled
        if let aboutMenuItem = self.aboutMenuItem {
            aboutMenuItem.isEnabled = true
        }

        // Intentional, the quit option should always be enabled
        if let quitMenuItem = self.quitMenuItem {
            quitMenuItem.isEnabled = true
        }
    }

    static func enableAllMenuBarItems() {
        if let startMenuItem = self.startMenuItem {
            startMenuItem.isEnabled = true
        }

        // Intentional, the default state of stop should be disabled as nothing is running
        if let stopMenuItem = self.stopMenuItem {
            stopMenuItem.isEnabled = false
        }

        if let hideOrShowMenuItem = self.hideOrShowMenuItem {
            hideOrShowMenuItem.isEnabled = true
        }

        if let preferencesMenuItem = self.preferencesMenuItem {
            preferencesMenuItem.isEnabled = true
        }

        if let aboutMenuItem = self.aboutMenuItem {
            aboutMenuItem.isEnabled = true
        }

        if let quitMenuItem = self.quitMenuItem {
            quitMenuItem.isEnabled = true
        }
    }

    @objc static func menuActionStart(sender: NSMenuItem) {
        AutoClickSimulator.shared.start()
    }

    @objc static func menuActionStop(sender: NSMenuItem) {
        AutoClickSimulator.shared.stop()
    }

    @objc static func menuActionHideOrShow(sender: NSMenuItem) {
        if NSApp.isHidden {
            NSApp.activate(ignoringOtherApps: true)
            NSApp.unhide(sender)
        } else {
            NSApp.hide(sender)
        }
    }

    @objc static func menuActionPreferences(sender: NSMenuItem) {
        NSApp.activate(ignoringOtherApps: true)

        // https://stackoverflow.com/questions/65355696/how-to-programatically-open-settings-window-in-a-macos-swiftui-app
        NSApp.sendAction(Selector(("showSettingsWindow:")), to: nil, from: nil)
    }

    @objc static func menuActionAbout(sender: NSMenuItem) {
        NSApp.activate(ignoringOtherApps: true)

        // This isn't documented anywhere SEO'able ~ meaning I ended up trawling menu bar apps I had installed to see if they had
        //  this functionality and then checking the GitHub repo's powering them to see how they did it.
        // Turns out Rectangle have this implemented, so I scoured their repo to see how they did it:
        // https://github.com/rxhanson/Rectangle/blob/master/Rectangle/AppDelegate.swift#L204
        // Undocumented Apple methods strike again!
        NSApp.orderFrontStandardAboutPanel(sender)
    }

    @objc static func menuActionQuit(sender: NSMenuItem) {
        NSApp.terminate(self)
    }
}
