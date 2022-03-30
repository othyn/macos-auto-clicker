//
//  UserDefaults.swift
//  auto-clicker
//
//  Created by Ben Tindall on 30/03/2022.
//

import Foundation
import Cocoa
import Defaults

extension Defaults.Keys {
    static let windowShouldKeepOnTop = Key<Bool>("window_should_keep_on_top", default: false)

    static let appearanceSelectedTheme = Key<Theme>("appearance_selected_theme", default: .Blue)
}
