//
//  NumberField.swift
//  auto-clicker
//
//  Created by Ben Tindall on 12/05/2021.
//

import SwiftUI
import Combine

struct NumberField: View {
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
        TextField(self.text, text: self.$rawString)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .onReceive(Just(self.rawString), perform: self.numericValidator)
            .onAppear(perform: {
                self.rawString = String(self.number)
            })
    }
}

//struct NumberField_Previews: PreviewProvider {
//    static var previews: some View {
//        NumberField(text: "Number Field", min: 0, max: 100, number: .constant(10))
//    }
//}
