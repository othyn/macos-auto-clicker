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

    static let menuBarShowIcon   = Key<Bool>("menu_bar_show_icon", default: true)
    static let menuBarStartTo    = Key<Bool>("menu_bar_start_to", default: false)
    static let menuBarMinimiseTo = Key<Bool>("menu_bar_minimise_to", default: false)
    static let menuBarCloseTo    = Key<Bool>("menu_bar_close_to", default: false)

    static let appearanceSelectedTheme = Key<ThemeService>("appearance_selected_theme", default: ThemeService())

    static let autoClickerState = Key<FormState>("user_form_state", default: FormState())
}
