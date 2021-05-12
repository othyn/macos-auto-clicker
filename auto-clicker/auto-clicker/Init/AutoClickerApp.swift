//
//  auto_clickerApp.swift
//  auto-clicker
//
//  Created by Ben Tindall on 12/05/2021.
//

import SwiftUI

struct windowSize {
    let width: CGFloat = 225
    let height: CGFloat = 400
}

@main
struct AutoClickerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: windowSize().width, minHeight: windowSize().height)
                .frame(maxWidth: windowSize().width, maxHeight: windowSize().height)
        }
    }
}
