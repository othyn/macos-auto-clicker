//
//  StatusBarView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 16/07/2022.
//

import SwiftUI

struct StatusBarView: View {
    var body: some View {
        GroupBox {
            Button("Button 1") {
                print("Button 1")
            }

            Divider()

            Button("Button 2") {
                print("Button 2")
            }

            Divider()

            Button("Button 3") {
                print("Button 3")
            }
        }
        .padding()
    }
}
