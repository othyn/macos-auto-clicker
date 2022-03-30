//
//  WindowStateService.swift
//  auto-clicker
//
//  Created by Ben Tindall on 30/03/2022.
//

import Foundation
import Cocoa

struct WindowStateService {
    static let width: CGFloat = 550
    static let height: CGFloat = 430
    
    static var keepOnTop: Bool = false
    
    static func toggleKeepWindowOnTop(_ keepOnTop: Bool) -> Void {
        if let window = NSApplication.shared.mainWindow {
            if keepOnTop {
                window.level = .floating
            } else {
                window.level = .normal
            }
        }
    }
}
