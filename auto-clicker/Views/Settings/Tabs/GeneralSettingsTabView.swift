//
//  GeneralSettingsTabView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 30/03/2022.
//

import Foundation
import SwiftUI
import Defaults

struct GeneralSettingsTabView: View {
    @StateObject private var zoop = Zoop()

    @Default(.menuBarShowIcon) private var menuBarShowIcon
    @Default(.appShouldQuitOnClose) private var appShouldQuitOnClose

    var body: some View {
        SettingsTabView {
            SettingsTabItemView(
                title: "settings_general_app_should_quit_on_close_title",
                help: "settings_general_app_should_quit_on_close_help",
                divider: true
            ) {
                Defaults.Toggle(
                    " " + String(format: NSLocalizedString("settings_general_app_should_quit_on_close", comment: "App should quit on close toggle")),
                    key: .appShouldQuitOnClose
                )
            }

            SettingsTabItemView(
                title: "settings_general_menu_bar_show_icon_title",
                help: "settings_general_menu_bar_show_icon_help"
            ) {
                HStack {
                    Defaults.Toggle(
                        " " + String(format: NSLocalizedString("settings_general_menu_bar_show_icon", comment: "Icon in menu bar toggle")),
                        key: .menuBarShowIcon
                    )
                    .onChange { isOn in
                        MenuBarService.toggle(isOn)

                        // If the menu bar icon is turned off, enforce that the dock icon is restored
                        //  otherwise the user can get stuck!
                        if !isOn {
                            Defaults[.menuBarHideDock] = false
                            WindowStateService.refreshDockIconState()
                        }
                    }

                    Image(systemName: "cursorarrow.click.badge.clock")
                }
            }

            SettingsTabItemView(
                help: "settings_general_menu_bar_hide_dock_help",
                divider: true
            ) {
                Defaults.Toggle(
                    " " + String(format: NSLocalizedString("settings_general_menu_bar_hide_dock", comment: "Hide dock icon toggle")),
                    key: .menuBarHideDock
                )
                .onChange { _ in
                    WindowStateService.refreshDockIconState()
                }
                .disabled(!self.menuBarShowIcon)
            }

            Spacer()

            HStack {
                Spacer()

                Button(self.zoop.text, action: self.zoop.start)
                    .buttonStyle(.plain)
                    .font(.system(size: 28))

                Spacer()
            }
        }
    }
}

struct GeneralSettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralSettingsTabView()
    }
}
