//
//  DurationSelector.swift
//  auto-clicker
//
//  Created by Ben Tindall on 27/03/2022.
//

import SwiftUI

struct DurationSelector: View {
    @State private var showingDurationModal = false

    @Binding var selectedDuration: Duration

    var body: some View {
        Button(self.selectedDuration.localised) {
            self.showingDurationModal = true
        }
        .buttonStyle(UnderlinedButtonStyle())
        .sheet(isPresented: self.$showingDurationModal, content: {
            DurationModal(selected: self.$selectedDuration)
        })
    }
}
