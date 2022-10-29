//
//  SettingsView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 30/03/2022.
//

import SwiftUI
import Defaults

struct SettingsView: View {
    @Default(.appearanceSelectedTheme) private var activeTheme

    @State private var frameHeight: CGFloat = 100

    // Its easier to just set the .frame(height:) on each view, but I wanted to mimic the nice
    //  transition effect Apple have in their Work suite, but it appears SwiftUI doesn't animate
    //  the underlying NSHostingView frame size changes.
    private func changeFrameHeight(_ newHeight: CGFloat) {
//        withAnimation {
            self.frameHeight = newHeight
//        }
    }

    var body: some View {
        TabView {
            GeneralSettingsTabView()
                .tabItem {
                    Label("settings_general", systemImage: "gear")
                }
                .onAppear {
                    self.changeFrameHeight(330)
                }

            KeyboardShortcutsSettingsTabView()
                .tabItem {
                    Label("settings_keyboard_shortcuts", systemImage: "keyboard")
                }
                .onAppear {
                    self.changeFrameHeight(130)
                }

            WindowSettingsTabView()
                .tabItem {
                    Label("settings_window", systemImage: "macwindow")
                }
                .onAppear {
                    self.changeFrameHeight(110)
                }

            AppearanceSettingsTabView()
                .tabItem {
                    Label("settings_appearance", systemImage: "paintpalette")
                }
                .onAppear {
                    self.changeFrameHeight(200)
                }
        }
        .frame(width: WindowStateService.settingsMinWidth, height: self.frameHeight)
        .padding()
        // Would love to theme the tab bar, but I can only find information on iOS and UITabBar
        // with NSTabView not having that much information on how to do this...
    }
}

// struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
// }
