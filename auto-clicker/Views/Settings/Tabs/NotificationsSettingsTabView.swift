//
//  NotificationsSettingsTabView.swift
//  auto-clicker
//
//  Created by Anonymous-Alt-0 on 30/06/2023.
//

import Foundation
import SwiftUI
import Defaults
import UserNotifications

struct NotificationsSettingsTabView: View {
    var body: some View {
        SettingsTabView {
            SettingsTabItemView(
                title: "settings_general_notify_title"
            ) {
                Defaults.Toggle(
                    " " + String(format: NSLocalizedString("settings_general_notify_on_start", comment: "Notify on auto clicker start toggle")),
                    key: .notifyOnStart
                )
                .onChange { isOn in
                    if isOn {
                        PermissionsService.acquireNotificationPermissions()
                    }
                }
            }

            SettingsTabItemView(
                help: "settings_general_notify_help"
            ) {
                Defaults.Toggle(
                    " " + String(format: NSLocalizedString("settings_general_notify_on_finish", comment: "Notify on auto clicker finish toggle")),
                    key: .notifyOnFinish
                )
                .onChange { isOn in
                    if isOn {
                        PermissionsService.acquireNotificationPermissions()
                    }
                }
            }
        }
    }
}

struct NotificationsSettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsSettingsTabView()
    }
}
