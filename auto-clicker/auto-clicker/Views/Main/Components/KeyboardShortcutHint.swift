//
//  KeyboardShortcutHint.swift
//  auto-clicker
//
//  Created by Ben Tindall on 30/03/2022.
//

import SwiftUI
import KeyboardShortcuts
import Defaults

struct KeyboardShortcutHint: View {
    @Default(.appearanceSelectedTheme) var activeTheme
    
    let shortcut: KeyboardShortcuts.Name.Shortcut
    
    var body: some View {
        Text(shortcut.description)
            .foregroundColor(self.activeTheme.backgroundColour.darker)
            .font(.system(size: 11, weight: .medium, design: .rounded))
    }
}

//struct KeyboardShortcutHint_Previews: PreviewProvider {
//    static var previews: some View {
//        KeyboardShortcutHint()
//    }
//}
