//
//  OptionsCommands.swift
//  auto-clicker
//
//  Created by Ben Tindall on 30/03/2022.
//

import Foundation
import SwiftUI

struct OptionsCommands: Commands {
    
    @Binding var keepWindowOnTop: Bool

    var body: some Commands {
        CommandMenu("Options") {
            Toggle("Keep window on top", isOn: self.$keepWindowOnTop)
                .keyboardShortcut("k")
        }
    }
}
