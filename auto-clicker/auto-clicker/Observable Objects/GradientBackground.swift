//
//  RandomBackground.swift
//  auto-clicker
//
//  Created by Ben Tindall on 12/05/2021.
//

import Foundation
import SwiftUI

class GradientBackground: ObservableObject {

    @Published var current: Image = Image(Backgrounds.allCases.randomElement()!.description)

    enum Backgrounds: String, CaseIterable, CustomStringConvertible {
        case Blue,
             Earth,
             Evening,
             Morning,
             Orange,
             Pink,
             Purple

        var description: String {
            return "gradient_\(self.rawValue.lowercased())"
        }
    }

    func randomise() -> Void {
        self.current = Image(Backgrounds.allCases.randomElement()!.description)
    }
}
