//
//  MouseMoveSelector.swift
//  auto-clicker
//
//  Created by Tomasz Pędraszewski on 04/07/2023.
//

import SwiftUI

struct MouseMoveSelector: View {
    @State private var showingMouseMoveModal = false

    @Binding var selectedMouseMove: MouseMove

    var body: some View {
        Button(self.selectedMouseMove.localised) {
            self.showingMouseMoveModal = true
        }
        .buttonStyle(UnderlinedButtonStyle())
        .sheet(isPresented: self.$showingMouseMoveModal, content: {
            MouseMoveModal(selected: self.$selectedMouseMove)
        })
    }
}
