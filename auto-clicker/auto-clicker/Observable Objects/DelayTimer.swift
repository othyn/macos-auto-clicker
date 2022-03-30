//
//  DelayTimer.swift
//  auto-clicker
//
//  Created by Ben Tindall on 12/05/2021.
//

import Foundation

class DelayTimer: ObservableObject {

    private static let defaultStartButtonText: String = "Start"
    
    @Published var isCountingDown: Bool = false

    @Published var remainingDelaySeconds: Int = DEFAULT_START_DELAY
    @Published var startButtonText: String = defaultStartButtonText

    private var onFinish: () -> Void = {}
    private var timer: Timer?

    func start(delayInSeconds: Int, onFinish: @escaping () -> Void) -> Void {
        self.onFinish = onFinish

        if delayInSeconds > 0 {
            self.remainingDelaySeconds = delayInSeconds
            self.isCountingDown = true
            
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

    @objc func tick() -> Void {
        self.remainingDelaySeconds -= 1

        self.updateButtonText()

        if self.remainingDelaySeconds <= 0 {
            self.stop()
        }
    }

    func stop() -> Void {
        self.remainingDelaySeconds = DEFAULT_START_DELAY
        self.startButtonText = DelayTimer.defaultStartButtonText

        self.isCountingDown = false

        self.onFinish()

        if let timer = self.timer {
            timer.invalidate()
        }
    }

    func updateButtonText() -> Void {
        self.startButtonText = String(self.remainingDelaySeconds)
    }
}
