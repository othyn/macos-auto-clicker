//
//  ModalButtonStyle.swift
//  auto-clicker
//
//  Created by Ben Tindall on 27/03/2022.
//

import SwiftUI

struct ModalButtonStyle: ButtonStyle {
    @State private var isHover = false
    
    var isDestructive: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            
            configuration.label
            
            Spacer()
        }
        .padding(.all, 10)
        .foregroundColor(
            self.isHover
            ? Color.white
            : self.isDestructive
                ? Color.red
                : Color.gray
        )
        .background((
            self.isHover
            ? configuration.isPressed
                ? Color.accentColor
                : Color.gray
            : Color.clear)
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
