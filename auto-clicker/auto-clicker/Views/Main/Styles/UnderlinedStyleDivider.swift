//
//  UnderlinedStyleDivider.swift
//  auto-clicker
//
//  Created by Ben Tindall on 27/03/2022.
//

import SwiftUI

struct UnderlinedStyleDivider: View {
    @EnvironmentObject var themeService: ThemeService
    
    var body: some View {
        // https://stackoverflow.com/a/60410373/4494375
        VStack {
            Rectangle()
                .fill(self.themeService.active.backgroundColour.darker)
                .offset(x: 0, y: 25)
                .frame(height: 3)
                .frame(minWidth: 10)
        }
    }
}

struct UnderlinedStyleDivider_Previews: PreviewProvider {
    static var previews: some View {
        UnderlinedStyleDivider()
    }
}
