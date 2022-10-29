//
//  DelayTimer.swift
//  auto-clicker
//
//  Created by Ben Tindall on 12/05/2021.
//

import Foundation
import Defaults
import Combine

final class DelayTimer: ObservableObject {
    static var shared: DelayTimer = .init()
    private init() {}

    private static let defaultCountdownText: String = "-"

    @Published var isCountingDown = false
    @Published var remainingDelaySeconds: Int = DEFAULT_START_DELAY
    @Published var countdownText: String = DelayTimer.defaultCountdownText

    private var onFinish: () -> Void = {}
    private var timer: Timer?
    private var activity: Cancellable?

    func start(onFinish: @escaping () -> Void) {
        let delayInSeconds = Defaults[.autoClickerState].startDelay

        self.onFinish = onFinish

        if let startMenuItem = MenuBarService.startMenuItem {
            startMenuItem.isEnabled = false
        }

        if let stopMenuItem = MenuBarService.stopMenuItem {
            stopMenuItem.isEnabled = true
        }

        if delayInSeconds > 0 {
            self.remainingDelaySeconds = delayInSeconds
            self.isCountingDown = true
            self.activity = ProcessInfo.processInfo.beginActivity(.delayTimer)

            self.updateButtonText()

            self.timer = Timer.scheduledTimer(timeInterval: 1,
                                              target: self,
                                              selector: #selector(self.tick),
                                              userInfo: nil,
                                              repeats: true)
        } else {
            self.onFinish()
        }
    }

    @objc func tick() {
        self.remainingDelaySeconds -= 1

        self.updateButtonText()

        if self.remainingDelaySeconds <= 0 {
            self.stop()
            self.onFinish()
        }
    }

    func stop() {
        self.remainingDelaySeconds = DEFAULT_START_DELAY
        self.countdownText = DelayTimer.defaultCountdownText

        self.isCountingDown = false

        self.activity?.cancel()
        self.activity = nil

        if let timer = self.timer {
            timer.invalidate()
        }
    }

    func updateButtonText() {
        self.countdownText = String(self.remainingDelaySeconds)
    }
}
