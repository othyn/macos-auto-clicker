import SwiftUI

struct DynamicWidthNumberField: View {
    var placeholder: String
    var min: Int
    var max: Int

    @Binding var number: Int

    @State private var draft: String = ""
    @FocusState private var isFocused: Bool

    var body: some View {
        DynamicWidthTextField(title: placeholder, text: $draft)
            .textFieldStyle(UnderlinedTextFieldStyle())
            .padding(.horizontal, 5)
            .focused($isFocused)
            .onAppear {
                draft = String(number)
            }
            .onChange(of: isFocused) { focused in
                if !focused {
                    commitInput()
                }
            }
            .onChange(of: draft) { newValue in
                // Filter out non-digit input
                let filtered = newValue.filter { $0.isWholeNumber }
                if filtered != newValue {
                    draft = filtered
                }
            }
    }

    private func commitInput() {
        guard let newValue = Int(draft) else {
            // Restore last known valid number
            draft = String(number)
            return
        }

        let clamped = Swift.min(Swift.max(newValue, min), max)
        number = clamped
        draft = String(clamped)
    }
}
