//
//  ActionStageLine.swift
//  auto-clicker
//
//  Created by Ben Tindall on 27/03/2022.
//

import SwiftUI

struct ActionStageLine<Content: View>: View {
    @ViewBuilder
    var content: () -> Content

    var body: some View {
        HStack() {
            HStack(content: content)
            
            Spacer()
        }
    }
}

struct ActionStageLine_Previews: PreviewProvider {
    static var previews: some View {
        ActionStageLine() {
            Text("Test")
        }
    }
}
