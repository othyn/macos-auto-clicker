//
//  Duration.swift
//  auto-clicker
//
//  Created by Ben Tindall on 26/02/2022.
//

import Foundation
import SwiftUI

enum Duration: String, CustomStringConvertible, CaseIterable, Identifiable, Codable {
    case milliseconds = "duration_milliseconds"
    case seconds = "duration_seconds"
    case minutes = "duration_minutes"
    case hours = "duration_hours"

    var id: String {
        self.rawValue
    }

    var description: String {
        self.rawValue
    }

    var localised: LocalizedStringKey {
        LocalizedStringKey(self.description)
    }

    var textView: some View {
        switch self {
        case .milliseconds, .seconds, .minutes, .hours:
            return Text(self.description)
        }
    }

    func buttonView(action: @escaping () -> Void) -> some View {
        switch self {
        case .milliseconds, .seconds, .minutes, .hours:
                return Button(action: action) {
                    Text(self.localised, comment: "Duration option buttons")
                }
        }
    }

    func asTimeInterval(interval: Int) -> TimeInterval {
        switch self {
        case .milliseconds:
            return TimeInterval(Double(interval) / 1_000)
        case .seconds:
            return TimeInterval(Double(interval))
        case .minutes:
            return TimeInterval(Double(interval) * 60)
        case .hours:
            return TimeInterval(Double(interval) * 60 * 60)
        }
    }
}
