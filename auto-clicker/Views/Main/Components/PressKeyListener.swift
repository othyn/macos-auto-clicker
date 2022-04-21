//
//  PressKeyListener.swift
//  auto-clicker
//
//  Created by Ben Tindall on 07/04/2022.
//

import SwiftUI
import Defaults

struct PressKeyListener: View {
    @State private var showingPressKeyListenerModal = false

    @Default(.autoClickerState) private var formState

    var body: some View {
        Button(self.formState.pressInput.readable) {
            self.showingPressKeyListenerModal = true
        }
        .buttonStyle(UnderlinedButtonStyle())
        .sheet(isPresented: self.$showingPressKeyListenerModal, content: {
            PressKeyListenerModal()
        })
    }
}
