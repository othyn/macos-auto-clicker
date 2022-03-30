//
//  AutoClickerApp.swift
//  auto-clicker
//
//  Created by Ben Tindall on 12/05/2021.
//

import Foundation
import SwiftUI

@main
struct AutoClickerApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var themeService = ThemeService()
    
    @State private var keepWindowOnTop: Bool = false

    var body: some Scene {
        Settings {
            SettingsView()
        }
        
        WindowGroup {
            ZStack {
                self.themeService.active.backgroundColour.ignoresSafeArea()
                
                MainView()
            }
            .frame(minWidth: WindowStateService.width, minHeight: WindowStateService.height)
            .frame(maxWidth: WindowStateService.width, maxHeight: WindowStateService.height)
            .environmentObject(self.themeService)
        }
        .windowStyle(.hiddenTitleBar)
        .commands {
            OptionsCommands(keepWindowOnTop: self.$keepWindowOnTop)
        }
        .onChange(of: self.keepWindowOnTop) { isOn in
            WindowStateService.toggleKeepWindowOnTop(isOn)
        }
    }
}
