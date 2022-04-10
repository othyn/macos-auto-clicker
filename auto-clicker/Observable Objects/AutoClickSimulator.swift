//
//  AutoClickSimulator.swift
//  auto-clicker
//
//  Created by Ben Tindall on 12/05/2021.
//

import Foundation
import Combine
import SwiftUI

final class AutoClickSimulator: ObservableObject {
    @Published var isAutoClicking = false

    // Some weird behaviour on macOS 11.2.3 and Swift 5 causes the app to hang on launch with these published and being passed through to View Bindings
//    @Published var clickInterval: Int = 50
//    @Published var amountOfClicks: Int = 1000

    @Published var remainingInterations: Int = 0

    @Published var nextClickAt: Date = .init()
    @Published var finalClickAt: Date = .init()

    // Said weird behaviour is still occuring in 12.2.1, thus having these defined in here instead of Published, I hate this though so much
    private var duration: Duration = .milliseconds
    private var interval: Int = DEFAULT_PRESS_INTERVAL
    private var amountOfPresses: Int = DEFAULT_REPEAT_AMOUNT
    private var input = Input()

    private var timer: Timer?
    private var mouseLocation: NSPoint { NSEvent.mouseLocation }

    // Some weird behaviour on macOS 11.2.3 and Swift 5 causes the app to hang on launch with these published and being passed through to View Bindings
//    func start() -> Void {
//        self.isAutoClicking = true
//
//        self.remainingClicks = self.amountOfClicks
//
//        self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(Double(self.clickInterval) / 1000),
//                                          target: self,
//                                          selector: #selector(self.tick),
//                                          userInfo: nil,
//                                          repeats: true)
//    }

    func start(duration: Duration, interval: Int, input: Input, presses: Int, iterations: Int) {
        self.isAutoClicking = true
        self.duration = duration
        self.interval = interval
        self.input = input
        self.amountOfPresses = presses
        self.remainingInterations = iterations

        self.finalClickAt = .init(timeInterval: self.duration.asTimeInterval(interval: self.interval * self.remainingInterations), since: .init())

        let timeInterval = self.duration.asTimeInterval(interval: self.interval)
        self.nextClickAt = .init(timeInterval: timeInterval, since: .init())
        self.timer = Timer.scheduledTimer(timeInterval: timeInterval,
                                          target: self,
                                          selector: #selector(self.tick),
                                          userInfo: nil,
                                          repeats: true)
    }

    func stop() {
        self.isAutoClicking = false

        // Force zero, as the user could stop the timer early
        self.remainingInterations = 0

        if let timer = self.timer {
            timer.invalidate()
        }
    }

    @objc private func tick() {
        self.remainingInterations -= 1

        self.press()

        self.nextClickAt = .init(timeInterval: self.duration.asTimeInterval(interval: self.interval), since: .init())

        if self.remainingInterations <= 0 {
            self.stop()
        }
    }

    private let mouseDownEventMap: [NSEvent.EventType: CGEventType] = [
        .leftMouseDown: .leftMouseDown,
        .leftMouseUp: .leftMouseDown,
        .rightMouseDown: .rightMouseDown,
        .rightMouseUp: .rightMouseDown,
        .otherMouseDown: .otherMouseDown,
        .otherMouseUp: .otherMouseDown
    ]

    private let mouseUpEventMap: [NSEvent.EventType: CGEventType] = [
        .leftMouseDown: .leftMouseUp,
        .leftMouseUp: .leftMouseUp,
        .rightMouseDown: .rightMouseUp,
        .rightMouseUp: .rightMouseUp,
        .otherMouseDown: .otherMouseUp,
        .otherMouseUp: .otherMouseUp
    ]

    private let mouseButtonEventMap: [NSEvent.EventType: CGMouseButton] = [
        .leftMouseDown: .left,
        .leftMouseUp: .left,
        .rightMouseDown: .right,
        .rightMouseUp: .right,
        .otherMouseDown: .center,
        .otherMouseUp: .center
    ]

    private func generateMouseClickEvents(source: CGEventSource?) -> [CGEvent?] {
        let mouseX = self.mouseLocation.x
        let mouseY = NSScreen.main!.frame.height - self.mouseLocation.y

        let clickingAtPoint = CGPoint(x: mouseX, y: mouseY)

        let mouseDownType: CGEventType = mouseDownEventMap[self.input.type]!
        let mouseUpType: CGEventType = mouseUpEventMap[self.input.type]!
        let mouseButton: CGMouseButton = mouseButtonEventMap[self.input.type]!

        let mouseDown = CGEvent(mouseEventSource: source,
                                mouseType: mouseDownType,
                                mouseCursorPosition: clickingAtPoint,
                                mouseButton: mouseButton)

        let mouseUp = CGEvent(mouseEventSource: source,
                              mouseType: mouseUpType,
                              mouseCursorPosition: clickingAtPoint,
                              mouseButton: mouseButton)

        return [mouseDown, mouseUp]
    }

    private func generateKeyPressEvents(source: CGEventSource?) -> [CGEvent?] {
        #if DEBUG
        print("PRESSING  |  [key] \(self.input.readable)  |  [MOD FLAGS] \(self.input.modifiers)")
        #endif

        let keyDown = CGEvent(keyboardEventSource: source,
                              virtualKey: CGKeyCode(self.input.keyCode),
                              keyDown: true)

        let keyUp = CGEvent(keyboardEventSource: source,
                            virtualKey: CGKeyCode(self.input.keyCode),
                            keyDown: false)

        if self.input.modifiers.contains(.command) {
            keyDown?.flags = CGEventFlags.maskCommand
            keyUp?.flags = CGEventFlags.maskCommand
        }

        if self.input.modifiers.contains(.control) {
            keyDown?.flags = CGEventFlags.maskControl
            keyUp?.flags = CGEventFlags.maskControl
        }

        if self.input.modifiers.contains(.option) {
            keyDown?.flags = CGEventFlags.maskAlternate
            keyUp?.flags = CGEventFlags.maskAlternate
        }

        if self.input.modifiers.contains(.shift) {
            keyDown?.flags = CGEventFlags.maskShift
            keyUp?.flags = CGEventFlags.maskShift
        }

        return [keyDown, keyUp]
    }

    private func press() {
        let source: CGEventSource? = CGEventSource(stateID: .hidSystemState)

        let pressEvents = self.input.isMouseInput
                            ? generateMouseClickEvents(source: source)
                            : generateKeyPressEvents(source: source)

        var completedPressesThisAction = 0

        while completedPressesThisAction < self.amountOfPresses {
            for event in pressEvents {
                event?.post(tap: .cghidEventTap)
            }

            completedPressesThisAction += 1
        }
    }
}
