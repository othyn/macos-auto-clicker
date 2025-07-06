//
//  SettingsTabItemView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 16/07/2022.
//

import SwiftUI

struct SettingsTabItemView<Content: View>: View {
    var title: LocalizedStringKey?
    var help: LocalizedStringKey?
    var divider: Bool
    var content: () -> Content

    init(title: LocalizedStringKey? = nil, help: LocalizedStringKey? = nil, divider: Bool = false, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.help = help
        self.divider = divider
        self.content = content
    }

    var body: some View {
        if let title = self.title {
            Text(title)
                .fontWeight(.bold)
        }

        VStack(alignment: .leading, spacing: 4, content: self.content)

        if let help = self.help {
            Text(help)
                .font(.footnote)
                .padding(.bottom, self.divider ? 0 : 8)
        }

        if self.divider {
            Divider()
                .padding(.vertical)
        }
    }
}
