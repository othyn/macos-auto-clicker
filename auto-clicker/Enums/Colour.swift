//
//  Colour.swift
//  auto-clicker
//
//  Created by Ben Tindall on 11/07/2022.
//

import Foundation
import SwiftUI
import Defaults

enum Colour: ThemeColour, Identifiable, CaseIterable, Codable {
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

    var localised: LocalizedStringKey {
        switch self {
        case .Black:
            return "colour_black"
        case .Blue:
            return "colour_blue"
        case .Brown:
            return "colour_brown"
        case .Cyan:
            return "colour_cyan"
        case .Gray:
            return "colour_gray"
        case .Green:
            return "colour_green"
        case .Indigo:
            return "colour_indigo"
        case .Mint:
            return "colour_mint"
        case .Orange:
            return "colour_orange"
        case .Pink:
            return "colour_pink"
        case .Purple:
            return "colour_purple"
        case .Red:
            return "colour_red"
        case .Teal:
            return "colour_teal"
        case .White:
            return "colour_white"
        case .Yellow:
            return "colour_yellow"
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
