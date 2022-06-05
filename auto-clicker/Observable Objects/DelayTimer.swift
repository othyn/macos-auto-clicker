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
    private static let defaultStartButtonText: String = "Start"

    @Published var isCountingDown = false
    @Published var remainingDelaySeconds: Int = DEFAULT_START_DELAY
    @Published var startButtonText: String = defaultStartButtonText

    private var onFinish: () -> Void = {}
    private var timer: Timer?
    private var activity: Cancellable?

    func start(onFinish: @escaping () -> Void) {
        let delayInSeconds = Defaults[.autoClickerState].startDelay

        self.onFinish = onFinish

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
        }
    }

    func stop() {
        self.remainingDelaySeconds = DEFAULT_START_DELAY
        self.startButtonText = DelayTimer.defaultStartButtonText

        self.isCountingDown = false

        self.activity?.cancel()
        self.activity = nil

        self.onFinish()

        if let timer = self.timer {
            timer.invalidate()
        }
    }

    func updateButtonText() {
        self.startButtonText = String(self.remainingDelaySeconds)
    }
}
