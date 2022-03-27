//
//  DurationTextField.swift
//  auto-clicker
//
//  Created by Ben Tindall on 27/03/2022.
//

import SwiftUI

struct DurationTextField: View {
    @Binding var text: String
    
    var width: CGFloat = 40
    
    var body: some View {
        TextField("", text: self.$text)
            .textFieldStyle(UnderlinedTextFieldStyle())
            .frame(width: self.width)
    }
}

struct DurationTextField_Previews: PreviewProvider {
    static var previews: some View {
        DurationTextField(text: .constant("test"))
    }
}
