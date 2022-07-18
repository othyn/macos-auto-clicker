//
//  KeyboardShortcuts+Extensions.swift
//  auto-clicker
//
//  Created by Ben Tindall on 17/07/2022.
//

import Foundation
import KeyboardShortcuts

extension KeyboardShortcuts.Shortcut {
    /**
    The string representation of the keyboard shortcut key only.

    ```
    print(Shortcut(.a, modifiers: [.command]))
    //=> "A"
    ```
    */
    public var descriptionKeyOnly: String {
        // 'keyToCharacter' is inaccessible due to 'fileprivate' protection level
        // :(
//        modifiers.description + (keyToCharacter()?.uppercased() ?? "�")

        // Hacky due to the above fileprivate protection level of keyToCharacter()
        // So just strip the modifier from the string to gain access to a string representation of just the key alone
        self.description.replacingOccurrences(of: modifiers.description, with: "")
    }
}
