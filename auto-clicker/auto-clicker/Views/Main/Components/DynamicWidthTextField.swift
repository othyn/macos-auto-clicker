//
//  DynamicWidthTextField.swift
//  auto-clicker
//
//  Created by Ben Tindall on 28/03/2022.
//

import SwiftUI

// https://github.com/joehinkle11/TextFieldDynamicWidth
struct DynamicWidthTextField: View {
    let title: String
    @Binding var text: String

    @State private var textRect = CGRect()

    var body: some View {
        ZStack {
            Text(text == "" ? title : text)
                .background(GlobalGeometryGetter(rect: $textRect))
                .layoutPriority(1)
                .opacity(0)

            HStack {
                TextField(title, text: $text)
                    .frame(width: textRect.width)
            }
        }
    }
}

// https://stackoverflow.com/a/56729880/3902590
struct GlobalGeometryGetter: View {
    @Binding var rect: CGRect

    var body: some View {
        GeometryReader { geometry in
            self.makeView(geometry: geometry)
        }
    }

    func makeView(geometry: GeometryProxy) -> some View {
        DispatchQueue.main.async {
            self.rect = geometry.frame(in: .global)
        }

        return Rectangle().fill(Color.clear)
    }
}
