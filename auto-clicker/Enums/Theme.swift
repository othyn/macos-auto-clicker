//
//  Theme.swift
//  auto-clicker
//
//  Created by Ben Tindall on 28/03/2022.
//

// TODO: Convert to using Colour, will need to update defaults loading

import Foundation
import SwiftUI
import Defaults

final class Theme: Codable, Defaults.Serializable {
    static let lightness: Double = 1.4
    static let darkness: Double = 0.6

    var currentColour: Colour {
        didSet {
            Defaults[.appearanceSelectedTheme] = self
        }
    }

    init() {
        self.currentColour = .Blue
    }

    var backgroundColour: ThemeColour {
        self.currentColour.normalised
    }

    var fontColour: ThemeColour {
        switch self.currentColour {
        case .Black,
             .Blue,
             .Brown,
             .Cyan,
             .Gray,
             .Indigo,
             .Mint,
             .Orange,
             .Pink,
             .Purple,
             .Red,
             .Teal:
            return .white
        case .Green,
             .White,
             .Yellow:
            return .black
        }
    }

    func randomise() {
        var newColour: Colour

        repeat {
            newColour = Colour.allCases.randomElement()!
        } while newColour == self.currentColour

        self.currentColour = newColour
    }
}
