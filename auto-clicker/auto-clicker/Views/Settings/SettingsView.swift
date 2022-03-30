//
//  SettingsView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 30/03/2022.
//

import SwiftUI
import Defaults

struct SettingsView: View {
    @Default(.appearanceSelectedTheme) var activeTheme
    
    var body: some View {
        TabView {
            GeneralSettingsTabView()
                .tabItem {
                    Label("General", systemImage: "gear")
                }
            
            KeyboardShortcutsSettingsTabView()
                .tabItem {
                    Label("Keyboard Shortcuts", systemImage: "keyboard")
                }
            
            WindowSettingsTabView()
                .tabItem {
                    Label("Window", systemImage: "macwindow")
                }
            
            AppearanceSettingsTabView()
                .tabItem {
                    Label("Appearance", systemImage: "paintpalette")
                }
        }
        .frame(width: WindowStateService.settingsWidth, height: WindowStateService.settingsHeight)
        .padding()
        // Would love to theme the tab bar, but I can only find information on iOS and UITabBar
        // with NSTabView not having that much information on how to do this...
    }
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
