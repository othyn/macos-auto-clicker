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
