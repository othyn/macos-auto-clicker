//
//  DurationModal.swift
//  auto-clicker
//
//  Created by Ben Tindall on 27/03/2022.
//

import SwiftUI

struct DurationModal: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var selected: Duration

    var body: some View {
        VStack {
            ForEach(Duration.allCases) { unit in
                unit.buttonView(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    
                    self.selected = unit
                })
                .buttonStyle(ModalButtonStyle())
            }

            // 'init(_:role:action:)' is only available in macOS 12.0 or newer
            // so cannot use a .destructive theme
            Button("Cancel") {
                self.presentationMode.wrappedValue.dismiss()
            }
            .buttonStyle(ModalButtonStyle(isDestructive: true))
        }
        .frame(width: WindowSize.width / 3.5, height: WindowSize.height / 2.2)
        .padding()
    }
}
