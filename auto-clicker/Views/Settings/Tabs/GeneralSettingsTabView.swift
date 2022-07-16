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
                    .onChange(MenuBarService.toggle)

                    Image(systemName: "cursorarrow.click.badge.clock")
                }
            }

            SettingsTabItemView(
                help: "settings_general_menu_bar_start_to_help"
            ) {
                Defaults.Toggle(
                    " " + String(format: NSLocalizedString("settings_general_menu_bar_start_to", comment: "Start app to menu bar toggle")),
                    key: .menuBarStartTo
                )
            }

            SettingsTabItemView(
                help: "settings_general_menu_bar_minimise_to_help"
            ) {
                Defaults.Toggle(
                    " " + String(format: NSLocalizedString("settings_general_menu_bar_minimise_to", comment: "Minimise app to menu bar toggle")),
                    key: .menuBarStartTo
                )
            }

            SettingsTabItemView(
                help: "settings_general_menu_bar_close_to_help",
                divider: true
            ) {
                Defaults.Toggle(
                    " " + String(format: NSLocalizedString("settings_general_menu_bar_close_to", comment: "Close app to menu bar toggle")),
                    key: .menuBarStartTo
                )
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
