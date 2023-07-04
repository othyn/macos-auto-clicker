//
//  MouseMove.swift
//  auto-clicker
//
//  Created by Tomasz Pędraszewski on 04/07/2023.
//

import Foundation
import SwiftUI

enum MouseMove: String, CustomStringConvertible, CaseIterable, Identifiable, Codable {
    case enabled = "mousemove_enabled"
    case disabled = "mousemove_disabled"

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
        case .enabled, .disabled:
            return Text(self.description)
        }
    }

    func buttonView(action: @escaping () -> Void) -> some View {
        switch self {
        case .enabled, .disabled:
                return Button(action: action) {
                    Text(self.localised, comment: "Mouse move option buttons")
                }
        }
    }

    func asBoolean() -> Bool {
        switch self {
        case .enabled:
            return true
        case .disabled:
            return false
        }
    }
}
