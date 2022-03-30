//
//  SettingsView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 30/03/2022.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        TabView {
            GeneralSettingsTabView()
                .tabItem {
                    Label("General", systemImage: "gear")
                }
        }
        .frame(width: 350, height: 150)
    }
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
