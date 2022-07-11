//
//  SmallText.swift
//  auto-clicker
//
//  Created by Ben Tindall on 11/07/2022.
//

import SwiftUI

struct SmallText: View {
    var text: LocalizedStringKey

    init(_ text: LocalizedStringKey) {
        self.text = text
    }

    var body: some View {
        Text(self.text)
            .font(.system(size: 10))
    }
}
