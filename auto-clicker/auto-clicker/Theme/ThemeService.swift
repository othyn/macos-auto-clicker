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
        
        repeat {
            newTheme = Theme.allCases.randomElement()!
        } while newTheme == self.active
        
        self.active = newTheme
    }
}
