//
//  StatBox.swift
//  auto-clicker
//
//  Created by Ben Tindall on 29/03/2022.
//

import SwiftUI
import Defaults

struct StatBox: View {
    @Default(.appearanceSelectedTheme) private var activeTheme

    let title: LocalizedStringKey
    let value: String

    var body: some View {
        VStack {
            Text(self.title, comment: "Stat box title")
                .foregroundColor(self.activeTheme.backgroundColour.lighter)
                .font(.system(size: 10))

            Text(self.value)
                .foregroundColor(self.activeTheme.backgroundColour.lighter)
                .font(.system(size: 14))
        }
    }
}

// struct StatBox_Previews: PreviewProvider {
//    static var previews: some View {
//        StatBox()
//    }
// }
