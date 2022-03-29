//
//  Theme.swift
//  auto-clicker
//
//  Created by Ben Tindall on 28/03/2022.
//

import Foundation
import SwiftUI

// Commented out colours are macOS 12 only
enum Theme: String, CaseIterable {
    case Black,
         Blue,
//         Brown,
//         Cyan,
         Gray,
         Green,
//         Indigo,
//         Mint,
         Orange,
         Pink,
         Purple,
         Red,
//         Teal,
         White,
         Yellow
    
    static var lightness: Double = 1.3
    static var darkness: Double = 0.7
    
    var backgroundColour: ThemeColour {
        switch(self) {
        case .Black:  return .black
        case .Blue:   return .blue
//        case .Brown:  return .brown
//        case .Cyan:   return .cyan
        case .Gray:   return .gray
        case .Green:  return .green
//        case .Indigo: return .indigo
//        case .Mint:   return .mint
        case .Orange: return .orange
        case .Pink:   return .pink
        case .Purple: return .purple
        case .Red:    return .red
//        case .Teal:   return .teal
        case .White:  return .white
        case .Yellow: return .yellow
        }
    }
    
    var fontColour: ThemeColour {
        switch(self) {
        case .Black, .Blue, .Gray, .Orange, .Pink, .Purple, .Red:
            return .white
        case .Green, .White, .Yellow:
            return .black
        }
    }
}
