//
//  SettingsTabItemView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 16/07/2022.
//

import SwiftUI

struct SettingsTabItemView<Content: View>: View {
    var title: LocalizedStringKey
    var help: LocalizedStringKey
    var divider: Bool
    var content: () -> Content

    init(title: LocalizedStringKey, help: LocalizedStringKey, divider: Bool = false, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.help = help
        self.divider = divider
        self.content = content
    }

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(self.title)
                    .fontWeight(.bold)
                    .frame(width: WindowStateService.settingsWidthSide, alignment: .trailing)

                VStack(alignment: .leading) {
                    VStack(content: self.content)

                    // swiftlint:disable empty_string
                    if self.help != "" {
                        Text(self.help)
                            .font(.footnote)
                    }
                }
            }

            if self.divider {
                Divider()
                    .padding(.vertical)
            }
        }
    }
}
