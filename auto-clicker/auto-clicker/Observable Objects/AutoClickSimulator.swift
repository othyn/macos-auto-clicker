//
//  AutoClickSimulator.swift
//  auto-clicker
//
//  Created by Ben Tindall on 12/05/2021.
//

import Foundation
import Combine
import SwiftUI

class AutoClickSimulator: ObservableObject {
    private static let defaultClickingAt: String = "-"

    @Published var isAutoClicking = false

    // Some weird behaviour on macOS 11.2.3 and Swift 5 causes the app to hang on launch with these published and being passed through to View Bindings
//    @Published var clickInterval: Int = 50
//    @Published var amountOfClicks: Int = 1000

    @Published var remainingInterations: Int = 0
    @Published var clickingAt: String = defaultClickingAt

    @Published var nextClickAt: Date = .init()
    @Published var finalClickAt: Date = .init()

    // Said weird behaviour is still occuring in 12.2.1, thus having these defined in here instead of Published, I hate this though so much
    private var duration: Duration = .milliseconds
    private var interval: Int = DEFAULT_PRESS_INTERVAL
    private var amountOfPresses: Int = DEFAULT_REPEAT_AMOUNT

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

    func start(duration: Duration, interval: Int, presses: Int, iterations: Int) {
        self.isAutoClicking = true
        self.duration = duration
        self.interval = interval
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

    @objc func tick() {
        self.remainingInterations -= 1

        self.press()

        self.nextClickAt = .init(timeInterval: self.duration.asTimeInterval(interval: self.interval), since: .init())

        if self.remainingInterations <= 0 {
            self.stop()
        }
    }

    func stop() {
        self.isAutoClicking = false

        // Force zero, as the user could stop the timer early
        self.remainingInterations = 0

        self.clickingAt = AutoClickSimulator.defaultClickingAt

        if let timer = self.timer {
            timer.invalidate()
        }
    }

    func press() {
        let mouseX = self.mouseLocation.x
        let mouseY = NSHeight(NSScreen.screens[0].frame) - self.mouseLocation.y

        let source = CGEventSource(stateID: .hidSystemState)
        let clickingAtPoint = CGPoint(x: mouseX, y: mouseY)

        let mouseDown = CGEvent(mouseEventSource: source, mouseType: .leftMouseDown, mouseCursorPosition: clickingAtPoint, mouseButton: .left)
        let mouseUp = CGEvent(mouseEventSource: source, mouseType: .leftMouseUp, mouseCursorPosition: clickingAtPoint, mouseButton: .left)

        // Reset the completed presses in this action cycle
        var completedPressesThisAction = 0

        while completedPressesThisAction < self.amountOfPresses {
            mouseDown?.post(tap: .cghidEventTap)
            mouseUp?.post(tap: .cghidEventTap)

            completedPressesThisAction += 1
        }

        self.clickingAt = "x: \(mouseX.rounded()), y: \(mouseY.rounded())"
    }
}
