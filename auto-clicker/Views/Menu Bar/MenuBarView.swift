//
//  MenuBarView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 16/07/2022.
//

import SwiftUI

struct MenuBarView: View {
    var body: some View {
        VStack {
            Button(
                action: {
                    print("Button 1")
                },
                label: {
                    Text("Button 1")
                }
            )
            .buttonStyle(.link)
        }
        .padding()
    }
}
