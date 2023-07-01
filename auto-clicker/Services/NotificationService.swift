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
        if body != nil { content.body = body! }
        content.sound = UNNotificationSound.default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: date.timeIntervalSinceNow.rounded(),
                                                        repeats: false)

        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }
}
