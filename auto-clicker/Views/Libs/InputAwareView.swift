//
//  InputAwareView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 07/04/2022.
//
//  See: https://onmyway133.com/posts/how-to-handle-keydown-in-swiftui-for-macos/
//  See: https://stackoverflow.com/a/61155272/4494375
//

import SwiftUI

struct InputAwareView: NSViewRepresentable {
    let onPress: (Input) -> Void

    func makeNSView(context: Context) -> NSView {
        let view = InputView()

        view.onPress = onPress

        DispatchQueue.main.async {
            view.window?.makeFirstResponder(view)
        }

        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {}
}

private class InputView: NSView {
    var onPress: (Input) -> Void = { _ in }

    override var acceptsFirstResponder: Bool { true }

    // left mouse down
    override func mouseDown(with event: NSEvent) {
        LoggerService.pressInputEvent(event: event)

        self.onPress(Input(event))
    }

    // right mouse down
    override func rightMouseDown(with event: NSEvent) {
        LoggerService.pressInputEvent(event: event)

        self.onPress(Input(event))
    }

    // other mouse down
    override func otherMouseDown(with event: NSEvent) {
        LoggerService.pressInputEvent(event: event)

        self.onPress(Input(event))
    }

    // any keyboard key down
    override func keyDown(with event: NSEvent) {
        LoggerService.pressInputEvent(event: event)

        self.onPress(Input(event))
    }
}
