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
        VStack {
            HStack(alignment: .top) {
                // Setting an empty string so we still get the frame size applied for layout uniformity
                Text(self.title ?? "")
                    .fontWeight(.bold)
                    .frame(width: WindowStateService.settingsWidthSide, alignment: .trailing)

                VStack(alignment: .leading) {
                    VStack(content: self.content)

                    if let help = self.help {
                        Text(help)
                            .font(.footnote)
                    }
                }
            }
        }

        if self.divider {
            Divider()
                .padding(.vertical)
        }
    }
}
