//
//  AppearanceSettingsTabView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 30/03/2022.
//

import SwiftUI
import Defaults

struct AppearanceSettingsTabView: View {
    @Default(.appearanceSelectedTheme) var activeTheme
    
    var body: some View {
        Form {
            LazyVGrid(columns: [.init(.adaptive(minimum: 70, maximum: 70))], spacing: 2) {
                ForEach(Theme.allCases) { theme in
                    Button(action: {
                        self.activeTheme = theme
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(theme.backgroundColour)
                                .frame(width: 45, height: 45)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(theme.backgroundColour.darker, lineWidth: 4)
                                )
                            
                            if theme == self.activeTheme {
                                Image(systemName: "checkmark")
                                    .font(.system(size: 24, weight: .medium))
                            }
                        }
                        .padding(.bottom, 15)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.top, 15)
        }
    }
}

struct AppearanceSettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppearanceSettingsTabView()
    }
}
