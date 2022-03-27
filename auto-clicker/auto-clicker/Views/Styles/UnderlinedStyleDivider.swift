//
//  UnderlinedStyleDivider.swift
//  auto-clicker
//
//  Created by Ben Tindall on 27/03/2022.
//

import SwiftUI

struct UnderlinedStyleDivider: View {
    var body: some View {
        // https://stackoverflow.com/a/60410373/4494375
        VStack {
            Divider()
                .frame(height: 2)
                .background(Color.blue)
                .offset(x: 0, y: 12)
//                        .padding(.horizontal, 30)
        }
    }
}

struct UnderlinedStyleDivider_Previews: PreviewProvider {
    static var previews: some View {
        UnderlinedStyleDivider()
    }
}
