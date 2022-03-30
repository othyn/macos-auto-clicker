//
//  ThemeColour.swift
//  auto-clicker
//
//  Created by Ben Tindall on 29/03/2022.
//

import Foundation
import SwiftUI

public typealias ThemeColour = Color

public extension ThemeColour {
    var lighter: ThemeColour {
        self.changeBrightness(Theme.lightness)
    }

    var darker: ThemeColour {
        self.changeBrightness(Theme.darkness)
    }
}
