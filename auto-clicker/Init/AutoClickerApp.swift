//
//  AutoClickerApp.swift
//  auto-clicker
//
//  Created by Ben Tindall on 12/05/2021.
//

import Foundation
import SwiftUI
import Defaults
import KeyboardShortcuts

@main
struct AutoClickerApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate

    // Despite using an EnvironmentObject to store the state as suggested on the Apple developer forums (only place I could
    //  find 'discussing' this issue), it appears the state is still not reflected in the MenuBarExtra scene.
    // https://developer.apple.com/forums/thread/720625?answerId=743546022#743546022
    @StateObject private var menuBarExtraState = MenuBarExtraState()

    // This is currently broken and causes an app crash:
    // https://github.com/sindresorhus/Defaults/issues/144
//    @Default(.menuBarShowIcon) private var menuBarShowIcon
    @State private var menuBarShowIcon = true

    var body: some Scene {
        Settings {
            SettingsView()
        }

        WindowGroup {
            ACWindow()
                .frame(minWidth: WindowStateService.mainWindowMinWidth,
                       idealWidth: WindowStateService.mainWindowMinWidth,
                       maxWidth: WindowStateService.mainWindowMinWidth * WindowStateService.mainWindowMaxDimensionMultiplier,
                       minHeight: WindowStateService.mainWindowMinHeight,
                       idealHeight: WindowStateService.mainWindowMinHeight,
                       maxHeight: WindowStateService.mainWindowMinHeight)
        }
        .windowStyle(.hiddenTitleBar)
        .windowResizability(.contentSize)
        .commands {
            HelpCommands()

            CommandGroup(replacing: CommandGroupPlacement.appInfo) {
                Button(NSLocalizedString("about_about", comment: "About") + " \(Bundle.main.appName)...") { delegate.showAboutWindow() }
            }
        }

        // Okay so this seems like a dead end.
        // The issue being that when the MenuBarExtra scene is in focus, it hangs the thread that the WindowGroup is running on, meaning the app stops functioning.
        // This isn't documented behaviour in either of Apple's resources on this:
        // - https://developer.apple.com/videos/play/wwdc2022/10061/
        // - https://developer.apple.com/documentation/SwiftUI/MenuBarExtra
        // Typically, there is little to no documentation or information on this.
        MenuBarExtra(isInserted: $menuBarShowIcon,
                     content: { MenuBarExtraContent().environmentObject(menuBarExtraState) },
                     label: { MenuBarExtraIcon() })
            .menuBarExtraStyle(.menu)
    }
}

struct MenuBarExtraIcon: View {
    @State private var sfSymbolVariableValue = 0.0

    let timer = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            Image(systemName: "cursorarrow.click.2", variableValue: sfSymbolVariableValue)
        }
        .onReceive(timer) { _ in
            if sfSymbolVariableValue < 1.0 {
                sfSymbolVariableValue += 0.25
            } else {
                sfSymbolVariableValue = 0.0
            }
        }
    }
}

struct MenuBarExtraContent: View {
    @EnvironmentObject private var menuBarExtraState: MenuBarExtraState

    private func menuBarActionStart() {
        AutoClickSimulator.shared.start()
    }

    private func menuBarActionStop() {
        AutoClickSimulator.shared.stop()
    }

    // This is bugged at the moment, if you hide the app, then close-open-close the menu, then click away the app closes :shrug:
    private func menuBarActionHideOrShow() {
        NSApplication.shared.activate(ignoringOtherApps: true)

        if NSApplication.shared.isHidden {
            NSApplication.shared.unhide(nil)

            self.menuBarExtraState.menuBarTextHideOrShow = NSLocalizedString("menu_bar_item_hide_show_hide", comment: "Menu bar item hide option")
        } else {
            NSApplication.shared.hide(nil)

            self.menuBarExtraState.menuBarTextHideOrShow = NSLocalizedString("menu_bar_item_hide_show_show", comment: "Menu bar item show option")
        }

        NSLog(self.menuBarExtraState.menuBarTextHideOrShow)
    }

    private func menuBarActionPreferences() {
        NSApplication.shared.activate(ignoringOtherApps: true)
        NSApplication.shared.sendAction(Selector(("showSettingsWindow:")), to: nil, from: nil)
    }

    private func menuBarActionAbout() {
        NSApplication.shared.activate(ignoringOtherApps: true)
        NSApplication.shared.orderFrontStandardAboutPanel()
    }

    private func menuBarActionQuit() {
        NSApplication.shared.terminate(nil)
    }

    var body: some View {
        let startButton = Button(NSLocalizedString("menu_bar_item_start", comment: "Menu bar item start option"),
                                 action: self.menuBarActionStart)

        if let shortcut = KeyboardShortcuts.Name.pressStartButton.shortcut,
           let keyEquivalent = shortcut.toKeyEquivalent() {
            startButton.keyboardShortcut(keyEquivalent, modifiers: shortcut.toEventModifiers())
        }

        let finishButton = Button(NSLocalizedString("menu_bar_item_stop", comment: "Menu bar item stop option"),
                                  action: self.menuBarActionStop)
            .disabled(true)

        if let shortcut = KeyboardShortcuts.Name.pressStopButton.shortcut,
           let keyEquivalent = shortcut.toKeyEquivalent() {
            finishButton.keyboardShortcut(keyEquivalent, modifiers: shortcut.toEventModifiers())
        }

        Divider()

        Button(self.menuBarExtraState.menuBarTextHideOrShow,
               action: self.menuBarActionHideOrShow)
            .keyboardShortcut("h")

        Divider()

        Button(NSLocalizedString("menu_bar_item_preferences", comment: "Menu bar item preferences option"),
               action: self.menuBarActionPreferences)
            .keyboardShortcut(",")

        Button(NSLocalizedString("menu_bar_item_about", comment: "Menu bar item about option"),
               action: self.menuBarActionAbout)

        Divider()

        Button(NSLocalizedString("menu_bar_item_quit", comment: "Menu bar item quit option"),
               action: self.menuBarActionQuit)
            .keyboardShortcut("q")
    }
}
