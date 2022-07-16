//
//  SettingsTabView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 16/07/2022.
//

import SwiftUI

struct SettingsTabView<Content: View>: ContainerView {
    var content: () -> Content

    var body: some View {
        GroupBox {
            Form(content: self.content)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
        }
    }
}
