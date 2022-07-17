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

// Good references:
// - https://khorbushko.github.io/article/2021/04/30/minimal-macOS-menu-bar-extra%27s-app-with-SwiftUI.html
// - https://github.com/kyan/kyan_bar/blob/master/KyanBar/MainMenu.swift
// - https://github.com/AnaghSharma/Ambar-SwiftUI/blob/master/Ambar/AppDelegate.swift
// - https://github.com/AnaghSharma/Ambar-SwiftUI/blob/master/Ambar/Helpers/StatusBarController.swift
// - https://stackoverflow.com/q/64816192/4494375
// - Annoyingly in Ventura/iOS 16 you can now just use the SwiftUI native MenuBarExtras method like WindowGroup and Settings in
//    the App, so in AutoClickerApp!

final private class StatusBarContentViewController: NSViewController {
    override func viewDidAppear() {
        super.viewDidAppear()

        // You can use a notification and observe it in a view model where you want to fetch the data for your SwiftUI view every time the popover appears.
        // NotificationCenter.default.post(name: Notification.Name("ViewDidAppear"), object: nil)
    }
}

final class MenuBarService {
    static var statusBar: NSStatusBar?
    static var statusItem: NSStatusItem?
    static var statusBarPopover: NSPopover?
    static var statusBarView: NSView?

    static func create() {
        self.statusBar = NSStatusBar.system
        self.statusItem = self.statusBar!.statusItem(withLength: NSStatusItem.variableLength)
        self.statusBarPopover = NSPopover()
        self.statusBarView = NSHostingView(rootView: StatusBarView())

        if let statusBarButton = self.statusItem!.button {
            statusBarButton.image = NSImage(systemSymbolName: "cursorarrow.click.badge.clock", accessibilityDescription: "auto clicker")
            statusBarButton.action = #selector(togglePopover(sender:))
            statusBarButton.target = self
        }

        self.statusBarPopover!.contentViewController = StatusBarContentViewController()
        self.statusBarPopover!.contentViewController?.view = self.statusBarView!
    }

    static func destroy() {
        MenuBarService.statusItem = nil
    }

    static func toggle(_ isEnabled: Bool) {
        if isEnabled {
            MenuBarService.create()
        } else {
            MenuBarService.destroy()
        }
    }

    static func refreshState() {
        MenuBarService.toggle(Defaults[.menuBarShowIcon])
    }

    @objc static func togglePopover(sender: AnyObject) {
        if self.statusBarPopover!.isShown {
            self.hidePopover(sender)
        } else {
            self.showPopover(sender)
        }
    }

    static func showPopover(_ sender: AnyObject) {
        if let statusBarButton = self.statusItem!.button {
            self.statusBarPopover!.show(relativeTo: statusBarButton.bounds, of: statusBarButton, preferredEdge: NSRectEdge.maxY)
        }
    }

    static func hidePopover(_ sender: AnyObject) {
        self.statusBarPopover!.performClose(sender)
    }
}
