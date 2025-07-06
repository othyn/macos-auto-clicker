//
//  FieldConstants.swift
//  auto-clicker
//
//  Created by Ben Tindall on 26/02/2022.
//

// swiftlint:disable identifier_name

import Foundation

// MARK: - Press Interval

let MIN_PRESS_INTERVAL: Int = 1
let MAX_PRESS_INTERVAL: Int = 100_000_000

let DEFAULT_PRESS_INTERVAL: Int = 50
let DEFAULT_PRESS_INTERVAL_MIN: Int = 50 // for range
let DEFAULT_PRESS_INTERVAL_MAX: Int = 100 // for range

// MARK: - Press Amount

let MIN_PRESS_AMOUNT: Int = 1
let MAX_PRESS_AMOUNT: Int = 100_000_000

let DEFAULT_PRESS_AMOUNT: Int = 1

// MARK: - Amount of times to repeat all actions

let MIN_REPEAT_AMOUNT: Int = 1
let MAX_REPEAT_AMOUNT: Int = 100_000_000

let DEFAULT_REPEAT_AMOUNT: Int = 100

// MARK: - Start Delay

let MIN_START_DELAY: Int = 0
let MAX_START_DELAY: Int = 100_000_000

let DEFAULT_START_DELAY: Int = 1
