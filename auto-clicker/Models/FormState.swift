//
//  FormState.swift
//  auto-clicker
//
//  Created by Ben Tindall on 10/04/2022.
//

import Defaults

// TODO: Debug the app hang when using Combine/Binds with MainView properties, disable them one by one to find the culprit (move from here to @State) and see if the app launches...

struct FormState: Codable, Defaults.Serializable {
    var pressInterval: Int
    var pressIntervalDuration: Duration
    var pressInput: Input
    var pressAmount: Int
    var startDelay: Int
//    var repeatDelayDuration: Duration
    var repeatAmount: Int
}

extension FormState {
    init() {
        self.pressInterval = DEFAULT_PRESS_INTERVAL
        self.pressIntervalDuration = Duration.milliseconds
        self.pressInput = Input()
        self.pressAmount = DEFAULT_PRESS_AMOUNT
        self.startDelay = DEFAULT_START_DELAY
//        self.repeatDelayDuration = Duration.seconds
        self.repeatAmount = DEFAULT_REPEAT_AMOUNT
    }
}
