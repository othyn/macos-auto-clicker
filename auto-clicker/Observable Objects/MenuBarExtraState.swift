//
//  MenuBarExtraState.swift
//  auto-clicker
//
//  Created by Ben Tindall on 03/07/2023.
//

import Foundation
import SwiftUI

final class MenuBarExtraState: ObservableObject {
    // https://developer.apple.com/forums/thread/720625?answerId=743546022#743546022
    @Published var menuBarTextHideOrShow = NSLocalizedString("menu_bar_item_hide_show_hide", comment: "Menu bar item hide option")

    @Published var startMenuDisabled = true
    @Published var stopMenuDisabled = true
    @Published var hideOrShowMenuDisabled = true
    @Published var preferencesMenuDisabled = true
    @Published var aboutMenuDisabled = false
    @Published var quitMenuDisabled = false

    // TODO:
    // - Set the disabled state on app launch depending on PermissionsService.shared.isTrusted state
    // - Wire up and abstract the stopMenuItem.isEnabled = true calls in the DelayTimer and AutoClickSimulator classes
    // - Tear down all old MenuBarService methods and properties, using that as reference for where other code may lay in the application

    func disableAllMenuBarItems() {
        self.startMenuDisabled = true
        self.stopMenuDisabled = true
        self.hideOrShowMenuDisabled = true
        self.preferencesMenuDisabled = true

        self.aboutMenuDisabled = false
        self.quitMenuDisabled = false
    }

    func enableAllMenuBarItems() {
        // Intentional, the default state of stop should be disabled as nothing is running
        self.stopMenuDisabled = true

        self.startMenuDisabled = false
        self.hideOrShowMenuDisabled = false
        self.preferencesMenuDisabled = false
        self.aboutMenuDisabled = false
        self.quitMenuDisabled = false
    }
}
