//
//  NSEvent+Extensions.swift
//  auto-clicker
//
//  Created by Ben Tindall on 08/04/2022.
//

import SwiftUI
import Carbon.HIToolbox

private var specialKeyMapping: [Int: String] = [
    kVK_Return: "↩",
    kVK_Delete: "⌫",
    kVK_End: "↘",
    kVK_Escape: "⎋",
    kVK_Help: "?⃝",
    kVK_Home: "↖",
    kVK_Space: "⎵",
    kVK_Tab: "⇥",
    kVK_PageUp: "⇞",
    kVK_PageDown: "⇟",
    kVK_UpArrow: "↑",
    kVK_RightArrow: "→",
    kVK_DownArrow: "↓",
    kVK_LeftArrow: "←",
    kVK_F1: "F1",
    kVK_F2: "F2",
    kVK_F3: "F3",
    kVK_F4: "F4",
    kVK_F5: "F5",
    kVK_F6: "F6",
    kVK_F7: "F7",
    kVK_F8: "F8",
    kVK_F9: "F9",
    kVK_F10: "F10",
    kVK_F11: "F11",
    kVK_F12: "F12",
    kVK_F13: "F13",
    kVK_F14: "F14",
    kVK_F15: "F15",
    kVK_F16: "F16",
    kVK_F17: "F17",
    kVK_F18: "F18",
    kVK_F19: "F19",
    kVK_F20: "F20"
]

private let unknownCharacterString = "unknown"

private func translateKey(event: NSEvent) -> String {
    if let character = specialKeyMapping[Int(event.keyCode)] {
        return character
    }

    return event.characters ?? unknownCharacterString
}

extension NSEvent {
    var inputString: String {
        switch self.type {
        case .leftMouseDown,
             .leftMouseUp:
            return NSLocalizedString("left_mouse_click", comment: "Left mouse button click")
        case .rightMouseDown,
             .rightMouseUp:
            return NSLocalizedString("right_mouse_click", comment: "Right mouse button click")
        case .otherMouseDown,
             .otherMouseUp:
            return NSLocalizedString("middle_mouse_click", comment: "Middle mouse button click")
        case .keyDown,
             .keyUp:
            return translateKey(event: self)
        default:
            return unknownCharacterString
        }
    }
}

private let mouseTypes: [NSEvent.EventType] = [
    .leftMouseDown,
    .leftMouseUp,
    .rightMouseDown,
    .rightMouseUp,
    .otherMouseDown,
    .otherMouseUp
]

extension NSEvent {
    var isMouseInput: Bool {
        mouseTypes.contains(self.type)
    }
}

extension NSEvent.EventType: Codable { }
