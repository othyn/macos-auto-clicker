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
            return Color.brown
        case .Cyan:
            return Color.cyan
        case .Gray:
            return .gray
        case .Green:
            return .green
        case .Indigo:
            return Color.indigo
        case .Mint:
            return Color.mint
        case .Orange:
            return .orange
        case .Pink:
            return .pink
        case .Purple:
            return .purple
        case .Red:
            return .red
        case .Teal:
            return Color.teal
        case .White:
            return .white
        case .Yellow:
            return .yellow
        }
    }
}
