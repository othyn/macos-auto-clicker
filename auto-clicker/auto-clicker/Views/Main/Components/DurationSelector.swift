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
        Button(self.selectedDuration.description) {
            self.showingDurationModal = true
        }
        .buttonStyle(UnderlinedButtonStyle())
        .sheet(isPresented: self.$showingDurationModal, content: {
            DurationModal(selected: self.$selectedDuration)
        })
//        Cannot use as I want to retain macOS 11 compatibility, although it would make it much easier to implement and have a slicker UI
//        .confirmationDialog("", isPresented: $showingDialogue, titleVisibility: .visible) {
//            Button("One") {}
//            Button("Two") {}
//            Button("Three") {}
//        }
    }
}

struct DurationSelector_Previews: PreviewProvider {
    static var previews: some View {
        DurationSelector(selectedDuration: .constant(.seconds))
    }
}
