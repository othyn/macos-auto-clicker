//
//  AutoClickerApp.swift
//  auto-clicker
//
//  Created by Ben Tindall on 12/05/2021.
//

import Foundation
import SwiftUI
import Cocoa

struct windowSize {
    static let width: CGFloat = 450
    static let height: CGFloat = 390
}

final class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        if let window = NSApplication.shared.windows.first {
            window.titlebarAppearsTransparent = true


            let customToolbar = NSToolbar()
            customToolbar.showsBaselineSeparator = false
            window.toolbar = customToolbar
        }
    }
}

@main
struct AutoClickerApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var background: GradientBackground = GradientBackground()

    var body: some Scene {
        WindowGroup {
            MainView(background: self.background)
                .frame(minWidth: windowSize.width, minHeight: windowSize.height)
                .frame(maxWidth: windowSize.width, maxHeight: windowSize.height)
                .font(.system(size: 12, weight: .medium, design: .rounded))
                .background(
                    VStack {
                        Spacer()

                        background
                            .current
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                })
        }
    }
}
