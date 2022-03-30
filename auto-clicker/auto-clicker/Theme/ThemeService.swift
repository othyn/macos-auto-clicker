//
//  ThemeService.swift
//  auto-clicker
//
//  Created by Ben Tindall on 28/03/2022.
//

import Foundation
import SwiftUI

public class ThemeService: ObservableObject {
    @Published var active: Theme = .Blue
    
    func randomise() -> Void {
        var newTheme: Theme

        if #available(macOS 12.0, *) {
            repeat {
                newTheme = Theme.allCases.randomElement()!
            } while newTheme == self.active
        } else {
            repeat {
                newTheme = Theme.allCases.randomElement()!
            } while newTheme == self.active || Theme.macOS12Colours.contains(newTheme)
        }
        
        self.active = newTheme
    }
}
