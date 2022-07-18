//
//  WindowStateService.swift
//  auto-clicker
//
//  Created by Ben Tindall on 30/03/2022.
//

import Foundation
import Cocoa
import Defaults

struct WindowStateService {
    static let mainWindowMinWidth: CGFloat = 550
    static let mainWindowMinHeight: CGFloat = 430
    static let mainWindowMaxDimensionMultiplier: CGFloat = 1.3

    static let settingsMinWidth: CGFloat = 500
    static var settingsWidthSide: CGFloat {
        WindowStateService.settingsMinWidth / 5
    }

    static let menuBarWidth: CGFloat = 150
    static let menuBarHeight: CGFloat = 500

    static func toggleKeepWindowOnTop(_ keepOnTop: Bool) {
        // This is somewhat finiky... I originally used NSApplication.shared.mainWindow as it contained the primary window
        //   but this has problems when using the preferences window as when the preferences window is open it becomes the
        //   mainWindow. So reverting back to NSApplication.shared.windows.first as the 'main' application window will be
        //   the first to load and take that place. BUT, it only works with applicationShouldTerminateAfterLastWindowClosed
        //   returning true, as the main window is never re-created due to the app just being terminated when it is closed.
        // If this behaviour is ever changed, then I'll need to somehow track the 'main' application window in the array of
        //   running application windows.
        if let window = NSApplication.shared.windows.first {
            if keepOnTop {
                window.level = .floating
            } else {
                window.level = .normal
            }
        }
    }

    static func refreshKeepWindowOnTop() {
        self.toggleKeepWindowOnTop(Defaults[.windowShouldKeepOnTop])
    }

    static func shouldExitOnClose() -> Bool {
        Defaults[.appShouldQuitOnClose]
    }

    static func toggleDockIcon(showIcon: Bool) -> Bool {
        showIcon
            ? NSApp.setActivationPolicy(NSApplication.ActivationPolicy.regular)
            : NSApp.setActivationPolicy(NSApplication.ActivationPolicy.accessory)
    }

    static func refreshDockIconState() {
        _ = self.toggleDockIcon(showIcon: !Defaults[.menuBarHideDock])
    }
}
