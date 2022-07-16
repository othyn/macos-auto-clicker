//
//  Defaults.swift
//  auto-clicker
//
//  Created by Ben Tindall on 30/03/2022.
//

import Foundation
import Cocoa
import Defaults

extension Defaults.Keys {
    static let appShouldQuitOnClose = Key<Bool>("app_should_quit_on_close", default: true)

    static let windowShouldKeepOnTop = Key<Bool>("window_should_keep_on_top", default: false)


    static let appearanceSelectedTheme = Key<ThemeService>("appearance_selected_theme", default: ThemeService())

    static let autoClickerState = Key<FormState>("user_form_state", default: FormState())
}
