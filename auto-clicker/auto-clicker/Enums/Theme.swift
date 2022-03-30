//
//  Theme.swift
//  auto-clicker
//
//  Created by Ben Tindall on 28/03/2022.
//

import Foundation
import SwiftUI
import Defaults

// Commented out colours are macOS 12 only
enum Theme: String, Identifiable, CaseIterable, Defaults.Serializable {
    
    static let lightness: Double = 1.4
    static let darkness: Double = 0.6
    
    static let macOS12Colours: [Theme] = [.Brown, .Cyan, .Indigo, .Mint, .Teal]
    
    case Black,
         Blue,
         Brown,
         Cyan,
         Gray,
         Green,
         Indigo,
         Mint,
         Orange,
         Pink,
         Purple,
         Red,
         Teal,
         White,
         Yellow
    
    var id: String {
        self.rawValue
    }
    
    // Even with the manual colour space calculated for the built in colours, I can't seem to get it to work
    // So I'll just exclude them from the randomisation
    var backgroundColour: ThemeColour {
        switch(self) {
            case .Black:  return .black
            case .Blue:   return .blue
            case .Brown:  if #available(macOS 12.0, *) { return Color.brown;  } else { return Color(.sRGBLinear, red: 163, green: 132, blue:  94, opacity: 1); }
            case .Cyan:   if #available(macOS 12.0, *) { return Color.cyan;   } else { return Color(.sRGBLinear, red:  84, green: 190, blue: 240, opacity: 1); }
            case .Gray:   return .gray
            case .Green:  return .green
            case .Indigo: if #available(macOS 12.0, *) { return Color.indigo; } else { return Color(.sRGBLinear, red:  88, green:  86, blue: 215, opacity: 1); }
            case .Mint:   if #available(macOS 12.0, *) { return Color.mint;   } else { return Color(.sRGBLinear, red:   3, green: 199, blue: 191, opacity: 1); }
            case .Orange: return .orange
            case .Pink:   return .pink
            case .Purple: return .purple
            case .Red:    return .red
            case .Teal:   if #available(macOS 12.0, *) { return Color.teal;   } else { return Color(.sRGBLinear, red:  89, green: 173, blue: 196, opacity: 1); }
            case .White:  return .white
            case .Yellow: return .yellow
        }
    }
    
    var fontColour: ThemeColour {
        switch(self) {
            case .Black, .Blue, .Brown, .Cyan, .Gray, .Indigo, .Mint, .Orange, .Pink, .Purple, .Red, .Teal:
                return .white
            case .Green, .White, .Yellow:
                return .black
        }
    }
    
    func randomise() -> Void {
        var newTheme: Theme

        if #available(macOS 12.0, *) {
            repeat {
                newTheme = Theme.allCases.randomElement()!
            } while newTheme == Defaults[.appearanceSelectedTheme]
        } else {
            repeat {
                newTheme = Theme.allCases.randomElement()!
            } while newTheme == Defaults[.appearanceSelectedTheme] || Theme.macOS12Colours.contains(newTheme)
        }

        Defaults[.appearanceSelectedTheme] = newTheme
    }
}
