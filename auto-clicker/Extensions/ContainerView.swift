//
//  ContainerView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 16/07/2022.
//

// See: https://www.swiftbysundell.com/tips/creating-custom-swiftui-container-views/

import Foundation
import SwiftUI

protocol ContainerView: View {
    associatedtype Content
    init(content: @escaping () -> Content)
}

extension ContainerView {
    init(@ViewBuilder _ content: @escaping () -> Content) {
        self.init(content: content)
    }
}
