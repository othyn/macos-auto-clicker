//
//  ACWindow.swift
//  auto-clicker
//
//  Created by Ben Tindall on 16/07/2022.
//

import SwiftUI
import Defaults

struct ACWindow: View {
    @Default(.appearanceSelectedTheme) private var activeTheme

    @StateObject private var permissionsService = PermissionsService()

    var body: some View {
        ZStack {
            self.activeTheme.backgroundColour.ignoresSafeArea()

            if self.permissionsService.isTrusted {
                MainView()
            } else {
                PermissionsView()
            }
        }
        .onAppear(perform: self.permissionsService.pollAccessibilityPrivileges)
    }
}
