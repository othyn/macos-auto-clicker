//
//  Input.swift
//  auto-clicker
//
//  Created by Ben Tindall on 09/04/2022.
//

import SwiftUI
import Defaults

struct Input: Codable, Defaults.Serializable {
    var readable: String
    var type: NSEvent.EventType
    var keyCode: UInt16
    var modifiers: [Modifier] = []
    var isMouseInput: Bool
    var isRepeat: Bool

    enum Modifier: String, Codable {
        case command = "⌘",
             control = "^",
             option = "⌥",
             shift = "⇧"
    }
}

extension Input {
    init() {
        self.readable = "Left Click"
        self.type = .leftMouseDown
        self.keyCode = 0
        self.modifiers = []
        self.isMouseInput = true
        self.isRepeat = false
    }
}

extension Input {
    init(_ event: NSEvent) {
        self.readable = event.inputString
        self.type = event.type
        self.isMouseInput = event.isMouseInput

        self.keyCode = event.isMouseInput ? 0 : event.keyCode
        self.isRepeat = event.isMouseInput ? false : event.isARepeat

        guard !event.isMouseInput else {
            return
        }

        if event.modifierFlags.contains(.command) {
            self.modifiers.append(.command)
        }

        if event.modifierFlags.contains(.control) {
            self.modifiers.append(.control)
        }

        if event.modifierFlags.contains(.option) {
            self.modifiers.append(.option)
        }

        if event.modifierFlags.contains(.shift) {
            self.modifiers.append(.shift)
        }
    }
}
