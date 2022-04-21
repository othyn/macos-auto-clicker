//
//  NSColor+Extensions.swift
//  auto-clicker
//
//  Created by Ben Tindall on 29/03/2022.
//

import Foundation
import SwiftUI

extension NSColor {
    var Color: Color {
        SwiftUI.Color(self)
    }
}

extension NSColor {
    func changeBrightness(_ newBrightness: CGFloat) -> NSColor {
        var hue: CGFloat = 0,
            saturation: CGFloat = 0,
            brightness: CGFloat = 0,
            alpha: CGFloat = 0

        // getHue will fail if this conversion is not present first
        // https://stackoverflow.com/a/46260353/4494375
        let convertedColor = self.usingColorSpace(.extendedSRGB)!

        convertedColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)

        return NSColor(hue: hue, saturation: saturation, brightness: newBrightness, alpha: alpha)
    }
}
