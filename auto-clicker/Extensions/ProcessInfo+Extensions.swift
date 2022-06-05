import Foundation
import Combine

enum Activity: String {
    case delayTimer
    case autoClicking

    var options: ProcessInfo.ActivityOptions {
        .userInitiated
    }

    var reason: String {
        rawValue
    }
}

extension ProcessInfo {
    func beginActivity(_ activity: Activity) -> Cancellable {
        let token = beginActivity(options: activity.options, reason: activity.reason)
        return AnyCancellable { self.endActivity(token) }
    }
}
