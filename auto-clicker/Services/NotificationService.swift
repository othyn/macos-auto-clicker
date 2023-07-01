//
//  NotificationService.swift
//  auto-clicker
//
//  Created by Anonymous-Alt-0 on 30/06/2023.
//

import Foundation
import UserNotifications

final class NotificationService: ObservableObject {
    static func scheduleNotification(title: String, body: String? = nil, date: Date) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.sound = UNNotificationSound.default

        if let body = body {
            content.body = body
        }

        let interval = date.timeIntervalSinceNow.rounded() > 0 ? date.timeIntervalSinceNow.rounded() : 1

        LoggerService.logNotification(title: title,
                                      date: date,
                                      interval: interval)

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval,
                                                        repeats: false)

        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }

    static func removePendingNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}
