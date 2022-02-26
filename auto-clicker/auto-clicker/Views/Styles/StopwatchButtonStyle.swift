//
//  StopwatchButtonStyle.swift
//  auto-clicker
//
//  Created by Ben Tindall on 26/02/2022.
//

import SwiftUI

struct StopwatchButtonStyle: ButtonStyle {
    let lightColour: Color
    let darkColour: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        SuperAmazingButton(configuration: configuration, lightColour: lightColour, darkColour: darkColour)
    }

    struct SuperAmazingButton: View {
        let configuration: ButtonStyle.Configuration
        
        let lightColour: Color
        let darkColour: Color

        @Environment(\.isEnabled) private var isEnabled: Bool

        func backgroundColor() -> Color {
            return !isEnabled ? .gray : lightColour
        }
        
        func backgroundColorDark() -> Color {
            return !isEnabled ? .gray : darkColour
        }

        var body: some View {
            configuration.label
                .frame(width: 125, height: 50)
                .foregroundColor(Color.white)
                .padding(.horizontal)
                .padding(.bottom, 1)
                .font(.system(size: 17, weight: .bold, design: .rounded))
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(backgroundColor())
                        .shadow(color: backgroundColorDark(),
                                radius: 0,
                                x: 0,
                                y: (configuration.isPressed ? 0 : 4))
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 15)
//                                .stroke(backgroundColorDark(), lineWidth: 3)
//                        )
                )
                .animation(.easeOut)
        }
    }
}
