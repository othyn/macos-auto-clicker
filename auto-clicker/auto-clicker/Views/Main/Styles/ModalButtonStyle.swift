//
//  ModalButtonStyle.swift
//  auto-clicker
//
//  Created by Ben Tindall on 27/03/2022.
//

import SwiftUI

struct ModalButtonStyle: ButtonStyle {
    
    @EnvironmentObject var themeService: ThemeService
    
    @State private var isHover = false
    
    var isDestructive: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            
            configuration.label
            
            Spacer()
        }
        .padding(.all, 10)
        .font(.system(size: 18))
        .foregroundColor(
            self.isHover
            ? self.themeService.active.fontColour
            : self.isDestructive
                ? self.themeService.active.backgroundColour.darker
                : self.themeService.active.fontColour
        )
        .background((
            self.isHover
            ? configuration.isPressed
                ? self.themeService.active.backgroundColour.lighter
                : self.themeService.active.backgroundColour.darker
            : ThemeColour.clear)
            .cornerRadius(8)
        )
        .overlay(
            VStack {
                Divider()
                    .frame(height: 1)
                    .offset(y: 20)
                    .padding(.horizontal, 10)
                    .opacity(self.isHover || self.isDestructive ? 0 : 1)
            }
        )
        .onHover(perform: { hover in
            isHover = hover
        })
    }
}
