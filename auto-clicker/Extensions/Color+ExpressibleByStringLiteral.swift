//
//  Color+ExpressibleByStringLiteral.swift
//  auto-clicker
//
//  Created by Ben Tindall on 11/07/2022.
//

// Required to use Color as an Enum type in Colour

import Foundation
import SwiftUI

extension Color: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(value)
    }
}
