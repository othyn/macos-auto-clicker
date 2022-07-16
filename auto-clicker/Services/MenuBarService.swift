//
//  MenuBarService.swift
//  auto-clicker
//
//  Created by Ben Tindall on 16/07/2022.
//

import Foundation
import Cocoa
import Defaults

final class MenuBarService {
    static var statusItem: NSStatusItem?

    static func enable() {
        MenuBarService.statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

        if let button = MenuBarService.statusItem!.button {
            button.image = NSImage(systemSymbolName: "cursorarrow.click.badge.clock", accessibilityDescription: "auto clicker")
        }
    }

    static func disable() {
        MenuBarService.statusItem = nil
    }

    static func toggle(_ isEnabled: Bool) {
        if isEnabled {
            MenuBarService.enable()
        } else {
            MenuBarService.disable()
        }
    }

    static func refreshState() {
        MenuBarService.toggle(Defaults[.menuBarShowIcon])
    }
}
