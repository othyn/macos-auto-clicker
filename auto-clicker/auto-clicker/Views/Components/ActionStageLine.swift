//
//  ActionStageLine.swift
//  auto-clicker
//
//  Created by Ben Tindall on 27/03/2022.
//

import SwiftUI

struct ActionStageLine<Content: View>: View {
    @ViewBuilder var content: () -> Content
    
    @EnvironmentObject var themeService: ThemeService

    var body: some View {
        HStack() {
            HStack(content: content)
                .font(.system(size: 32, weight: .light))
                .foregroundColor(self.themeService.active.fontColour)
            
            Spacer()
        }
    }
}

struct ActionStageLine_Previews: PreviewProvider {
    static var previews: some View {
        ActionStageLine() {
            Text("Test")
        }
    }
}
