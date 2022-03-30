//
//  StatBox.swift
//  auto-clicker
//
//  Created by Ben Tindall on 29/03/2022.
//

import SwiftUI

struct StatBox: View {
    
    @EnvironmentObject var themeService: ThemeService
    
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            Text(self.title.uppercased())
                .foregroundColor(self.themeService.active.backgroundColour.lighter)
                .font(.system(size: 10))
            
            Text(self.value)
                .foregroundColor(self.themeService.active.backgroundColour.lighter)
                .font(.system(size: 14))
        }
    }
}

//struct StatBox_Previews: PreviewProvider {
//    static var previews: some View {
//        StatBox()
//    }
//}
