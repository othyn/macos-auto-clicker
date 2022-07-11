//
//  ThemeColour.swift
//  auto-clicker
//
//  Created by Ben Tindall on 29/03/2022.
//

import Foundation
import SwiftUI

public typealias ThemeColour = Color

extension ThemeColour {
    var lighter: ThemeColour {
        self.changeBrightness(ThemeService.lightness)
    }

    var darker: ThemeColour {
        self.changeBrightness(ThemeService.darkness)
    }
}
