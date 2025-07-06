//
//  FormState.swift
//  auto-clicker
//
//  Created by Ben Tindall on 10/04/2022.
//

import Defaults

enum IntervalMode: String, Codable, CaseIterable, Identifiable {
    case staticInterval
    case rangeInterval

    var id: String { self.rawValue }
}

struct FormState: Codable, Defaults.Serializable {
    var intervalMode: IntervalMode // new: static or range
    var pressInterval: Int
    var pressIntervalMin: Int? // new: for range
    var pressIntervalMax: Int? // new: for range
    var pressIntervalDuration: Duration
    var pressInput: Input
    var pressAmount: Int
    var startDelay: Int
    var repeatAmount: Int
    var stopOnMouseMove: MouseMove
    var mouseDeltaThreshold: Int
}

extension FormState {
    init() {
        self.intervalMode = .staticInterval
        self.pressInterval = DEFAULT_PRESS_INTERVAL
        self.pressIntervalMin = nil
        self.pressIntervalMax = nil
        self.pressIntervalDuration = Duration.milliseconds
        self.pressInput = Input()
        self.pressAmount = DEFAULT_PRESS_AMOUNT
        self.startDelay = DEFAULT_START_DELAY
        self.repeatAmount = DEFAULT_REPEAT_AMOUNT
        self.stopOnMouseMove = MouseMove.disabled
        self.mouseDeltaThreshold = MIN_MOUSE_THRESHOLD
    }
}
