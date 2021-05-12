//
//  ContentView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 12/05/2021.
//

import SwiftUI

struct ContentView: View {

    @StateObject var autoClickSimulator: AutoClickSimulator = AutoClickSimulator()
    @StateObject var delayTimer: DelayTimer = DelayTimer()

    // Some weird behaviour on macOS 11.2.3 and Swift 5 causes the app to hang on launch with these published and being passed through to View Bindings
    @State private var clickIntervalInMilliseconds: Int = 50
    @State private var amountOfClicks: Int = 100

    // Stubbing methods to work around the weird hang issue
    func startStub() -> Void {
        self.delayTimer.start(onFinish: {
            self.autoClickSimulator.start(intervalInMilliseconds: self.clickIntervalInMilliseconds, iterations: self.amountOfClicks)
        })
    }

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Click interval in milliseconds:")

                    Spacer()
                }

//                NumberField(text: "Click interval", min: 0, max: 1000, number: self.$autoClickSimulator.clickInterval)
                NumberField(text: "Click interval", min: 0, max: 1000, number: self.$clickIntervalInMilliseconds)
                    .disabled(self.autoClickSimulator.isAutoClicking || self.delayTimer.isCountingDown)
            }
            .padding(.bottom, 5)

            VStack {
                HStack {
                    Text("Amount of clicks:")

                    Spacer()
                }

//                NumberField(text: "Amount of clicks", min: 0, max: 10000, number: self.$autoClickSimulator.amountOfClicks)
                NumberField(text: "Amount of clicks", min: 0, max: 10000, number: self.$amountOfClicks)
                    .disabled(self.autoClickSimulator.isAutoClicking || self.delayTimer.isCountingDown)
            }
            .padding(.bottom, 5)

            VStack {
                HStack {
                    Text("Keybind to start:")

                    Spacer()
                }

                TextField("Keybind to start", text: .constant("⌘S"))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disabled(true)
            }
            .padding(.bottom, 5)

            VStack {
                HStack {
                    Text("Keybind to stop:")

                    Spacer()
                }

                TextField("Keybind to stop", text: .constant("⌘X"))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disabled(true)
            }
            .padding(.bottom, 5)

            HStack {
                Toggle("Delayed start", isOn: self.$delayTimer.delayedStart)
                    .disabled(self.autoClickSimulator.isAutoClicking || self.delayTimer.isCountingDown)

                Spacer()
            }

            Spacer()

            HStack {
//                Button("Start", action: self.autoClickSimulator.start)
                Button(self.delayTimer.startButtonText, action: self.startStub)
                    .disabled(self.autoClickSimulator.isAutoClicking || self.delayTimer.isCountingDown)
                    .keyboardShortcut("s", modifiers: [.command])
                    .padding(.trailing, 10)

                Button("Stop", action: self.autoClickSimulator.stop)
//                    .disabled(!self.autoClickSimulator.isAutoClicking && !self.delayTimer.isCountingDown)
                    .disabled(!self.autoClickSimulator.isAutoClicking)
                    .keyboardShortcut("x", modifiers: [.command])
            }

            Spacer()

            HStack {
                Text("Remaining clicks:")

                Spacer()

                Text(String(self.autoClickSimulator.remainingClicks))
            }

            HStack {
                Text("Clicking at:")

                Spacer()

                Text(String(self.autoClickSimulator.clickingAt))
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
