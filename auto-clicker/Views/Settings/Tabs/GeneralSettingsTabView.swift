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
        Form {
            Button(self.zoop.text, action: self.zoop.start)
                .buttonStyle(.plain)
                .font(.system(size: 32))
        }
    }
}

struct GeneralSettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralSettingsTabView()
    }
}
