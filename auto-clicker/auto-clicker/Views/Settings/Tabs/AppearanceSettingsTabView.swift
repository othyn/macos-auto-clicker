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
            Picker("Active Theme", selection: self.$activeTheme) {
                ForEach(Theme.allCases) { theme in
                    HStack {
                        RoundedRectangle(cornerRadius: 2)
                            .fill(theme.backgroundColour)
                            .frame(width: 20, height: 10)

                        Text(theme.rawValue)
                    }
                    .tag(theme)
                }
            }
            
//            Button("Randomise".uppercased()) {
//                self.activeTheme.randomise()
//            }
//            .buttonStyle(StopwatchButtonStyle(fontSize: 16))
//            .font(.system(size: 24))
        }
    }
}

struct AppearanceSettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppearanceSettingsTabView()
    }
}
