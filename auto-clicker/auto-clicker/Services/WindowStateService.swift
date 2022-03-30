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
    static let width: CGFloat = 550
    static let height: CGFloat = 430
    
    static let settingsWidth: CGFloat = 400
    static let settingsHeight: CGFloat = 150
    
    static func toggleKeepWindowOnTop(_ keepOnTop: Bool) -> Void {
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
    
    static func refreshKeepWindowOnTop() -> Void {
        self.toggleKeepWindowOnTop(Defaults[.windowShouldKeepOnTop])
    }
}
