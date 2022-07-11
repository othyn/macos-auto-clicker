//
//  Colour.swift
//  auto-clicker
//
//  Created by Ben Tindall on 11/07/2022.
//

import Foundation
import SwiftUI
import Defaults

enum Colour: ThemeColour, Identifiable, CaseIterable, CustomStringConvertible, Codable {
    case Black,
         Blue,
         Brown,
         Cyan,
         Gray,
         Green,
         Indigo,
         Mint,
         Orange,
         Pink,
         Purple,
         Red,
         Teal,
         White,
         Yellow

    var id: ThemeColour {
        self.normalised
    }

    var description: String {
        switch self {
        case .Black:
            return "Black"
        case .Blue:
            return "Blue"
        case .Brown:
            return "Brown"
        case .Cyan:
            return "Cyan"
        case .Gray:
            return "Gray"
        case .Green:
            return "Green"
        case .Indigo:
            return "Indigo"
        case .Mint:
            return "Mint"
        case .Orange:
            return "Orange"
        case .Pink:
            return "Pink"
        case .Purple:
            return "Purple"
        case .Red:
            return "Red"
        case .Teal:
            return "Teal"
        case .White:
            return "White"
        case .Yellow:
            return "Yellow"
        }
    }

    var normalised: ThemeColour {
        switch self {
        case .Black:
            return .black
        case .Blue:
            return .blue
        case .Brown:
            if #available(macOS 12.0, *) {
                return Color.brown
            } else {
                return Color(.sRGBLinear, red: 163, green: 132, blue: 94, opacity: 1)
            }
        case .Cyan:
            if #available(macOS 12.0, *) {
                return Color.cyan
            } else {
                return Color(.sRGBLinear, red: 84, green: 190, blue: 240, opacity: 1)
            }
        case .Gray:
            return .gray
        case .Green:
            return .green
        case .Indigo:
            if #available(macOS 12.0, *) {
                return Color.indigo
            } else {
                return Color(.sRGBLinear, red: 88, green: 86, blue: 215, opacity: 1)
            }
        case .Mint:
            if #available(macOS 12.0, *) {
                return Color.mint
            } else {
                return Color(.sRGBLinear, red: 3, green: 199, blue: 191, opacity: 1)
            }
        case .Orange:
            return .orange
        case .Pink:
            return .pink
        case .Purple:
            return .purple
        case .Red:
            return .red
        case .Teal:
            if #available(macOS 12.0, *) {
                return Color.teal
            } else {
                return Color(.sRGBLinear, red: 89, green: 173, blue: 196, opacity: 1)
            }
        case .White:
            return .white
        case .Yellow:
            return .yellow
        }
    }
}
