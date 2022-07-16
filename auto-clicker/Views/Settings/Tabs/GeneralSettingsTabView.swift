//
//  GeneralSettingsTabView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 30/03/2022.
//

import Foundation
import SwiftUI

struct GeneralSettingsTabView: View {
    @StateObject private var zoop = Zoop()

    var body: some View {
        SettingsTabView {
            HStack {
                Spacer()

                Button(self.zoop.text, action: self.zoop.start)
                    .buttonStyle(.plain)
                    .font(.system(size: 28))

                Spacer()
            }
        }
    }
}

struct GeneralSettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralSettingsTabView()
    }
}
