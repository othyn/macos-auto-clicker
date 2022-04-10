//
//  DynamicWidthNumberField.swift
//  auto-clicker
//
//  Created by Ben Tindall on 29/03/2022.
//

import SwiftUI
import Combine

struct DynamicWidthNumberField: View {
    var text: String
    var min: Int
    var max: Int

    @Binding var number: Int

    @State private var rawString: String = ""

    func numericValidator(newValue: String) {
        let newValueNumbersOnly = newValue.filter { "0123456789".contains($0) }

        guard newValue == newValueNumbersOnly else {
            self.rawString = newValueNumbersOnly
            return
        }

        guard let newValueInt = Int(newValueNumbersOnly) else {
            self.rawString = String(self.number)
            return
        }

        guard newValueInt >= self.min else {
            self.rawString = String(self.min)
            return
        }

        guard newValueInt <= self.max else {
            self.rawString = String(self.max)
            return
        }

        // Hacky way to stop leading and stacked zeros
        self.rawString = String(newValueInt)

        self.number = newValueInt
    }

    var body: some View {
        DynamicWidthTextField(title: self.text, text: self.$rawString)
            .textFieldStyle(UnderlinedTextFieldStyle())
            .padding(.horizontal, 5)
            .onReceive(Just(self.rawString), perform: self.numericValidator)
            .onAppear(perform: {
                self.rawString = String(self.number)
            })
    }
}

// struct DynamicWidthNumberField_Previews: PreviewProvider {
//    static var previews: some View {
//        NumberField(text: "Number Field", min: 0, max: 100, number: .constant(10))
//    }
// }
