//
//  Duration.swift
//  auto-clicker
//
//  Created by Ben Tindall on 26/02/2022.
//

import Foundation
import SwiftUI

enum Duration: String, CustomStringConvertible, CaseIterable, Identifiable, Codable {
    case milliseconds = "Millisecond(s)"
    case seconds = "Second(s)"
    case minutes = "Minute(s)"
    case hours = "Hour(s)"

    var id: String {
        self.rawValue
    }

    var description: String {
        self.rawValue
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
            return Button(self.description, action: action)
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
