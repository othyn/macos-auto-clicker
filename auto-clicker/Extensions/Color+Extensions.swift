//
//  Color+Extensions.swift
//  auto-clicker
//
//  Created by Ben Tindall on 29/03/2022.
//

import Foundation
import SwiftUI

extension Color {
    func changeBrightness(_ newBrightness: CGFloat) -> Color {
        NSColor(self)
            .changeBrightness(newBrightness)
            .Color
    }
}
