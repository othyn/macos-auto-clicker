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

    func setInitNumber() {
        self.rawString = String(self.number)
    }

    func validate(oldRawString: String, newRawString: String) {
        let newRawStringNumeric = newRawString.filter { "0123456789".contains($0) }


        // Guard that the new value contains numeric characters only
        // Guard that the new value numeric only string is int cast successfully (should never fail anyway)
        // Else set the string to the last valid numerical value
        guard newRawString == newRawStringNumeric, var newNumber = Int(newRawStringNumeric) else {
            self.rawString = String(self.number)
            return
        }

        // Range validation
        if newNumber < self.min {
            newNumber = self.min
        }
        if newNumber > self.max {
            newNumber = self.max
        }

        self.number = newNumber

        // Hacky way to stop leading and stacked zeros
        self.rawString = String(self.number)
    }

    var body: some View {
        DynamicWidthTextField(title: self.text, text: self.$rawString)
            .textFieldStyle(UnderlinedTextFieldStyle())
            .padding(.horizontal, 5)
            .onChange(of: self.rawString) { [rawString] newValue in
                self.validate(oldRawString: rawString, newRawString: newValue)
            }
            .onAppear(perform: self.setInitNumber)
    }
}
