//
//  LoggerService.swift
//  auto-clicker
//
//  Created by Ben Tindall on 12/04/2022.
//

import SwiftUI

final class LoggerService {
    private static func log(file: String, function: String, _ lines: [String]) {
        #if DEBUG
        NSLog(">~  Who: \(file) ~ \(function)")

        for line in lines {
            NSLog(">~ What: \(line)")
        }
        #endif
    }

    static func permissionState(enabled: Bool, callingFile: String = #fileID, callingFunction: String = #function) {
        LoggerService.log(file: callingFile, function: callingFunction, [
            "App permissions \(enabled ? "" : "not ")granted"
        ])
    }

    static func notificationState(enabled: Bool, callingFile: String = #fileID, callingFunction: String = #function) {
        LoggerService.log(file: callingFile, function: callingFunction, [
            "Notification permissions \(enabled ? "" : "not ")granted"
        ])
    }

    static func permissionTrustedState(callingFile: String = #fileID, callingFunction: String = #function) {
        LoggerService.log(file: callingFile, function: callingFunction, [
            "Is trusted: \(AXIsProcessTrusted())"
        ])
    }

    static func numberValidator<CallingView: View>(view: CallingView, oldNumber: Int, oldString: String, newString: String, newIntString: String, callingFile: String = #fileID, callingFunction: String = #function) {
        LoggerService.log(file: callingFile, function: callingFunction, [
            "View: \(String(describing: type(of: view)))",
            "Old Number: \(oldNumber) | Old Value: \(oldString)",
            "New Number: \(newIntString) | New Value: \(newString)"
        ])
    }

    static func pressInputEvent(event: NSEvent, callingFile: String = #fileID, callingFunction: String = #function) {
        LoggerService.log(file: callingFile, function: callingFunction, [
            "Pressed: \(event.inputString)"
        ])
    }

    static func simPress(input: Input, location: CGPoint, callingFile: String = #fileID, callingFunction: String = #function) {
        LoggerService.log(file: callingFile, function: callingFunction, [
            "Key: \(input.readable)",
            "Mod: \(input.modifiers)",
            "Loc. X: \(location.x)",
            "Loc. Y: \(location.y)"
        ])
    }
}
