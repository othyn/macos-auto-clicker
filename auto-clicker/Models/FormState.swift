//
//  FormState.swift
//  auto-clicker
//
//  Created by Ben Tindall on 10/04/2022.
//

import Defaults

struct FormState: Codable, Defaults.Serializable {
    var pressInterval: Int
    var pressIntervalDuration: Duration
    var pressInput: Input
    var pressAmount: Int
    var startDelay: Int
    var repeatAmount: Int
}

extension FormState {
    init() {
        self.pressInterval = DEFAULT_PRESS_INTERVAL
        self.pressIntervalDuration = Duration.milliseconds
        self.pressInput = Input()
        self.pressAmount = DEFAULT_PRESS_AMOUNT
        self.startDelay = DEFAULT_START_DELAY
        self.repeatAmount = DEFAULT_REPEAT_AMOUNT
    }
}
