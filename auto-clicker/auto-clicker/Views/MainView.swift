//
//  MainView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 12/05/2021.
//

import SwiftUI

struct StopwatchButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        SuperAmazingButton(configuration: configuration)
    }

    struct SuperAmazingButton: View {
        let configuration: ButtonStyle.Configuration

        @Environment(\.isEnabled) private var isEnabled: Bool

        func backgroundColor() -> LinearGradient {
            if !isEnabled {
                return LinearGradient(gradient: Gradient(colors: [.gray]), startPoint: .leading, endPoint: .trailing)
            }

            return LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .leading, endPoint: .trailing)
        }

        var body: some View {
            configuration.label
                .frame(width: 125, height: 50)
                .foregroundColor(Color.white)
                .background(backgroundColor())
                .cornerRadius(8.0)
                .padding(.horizontal)
                .padding(.bottom, 1)
                .shadow(radius: 4)
        }
    }
}

struct MainView: View {

    @StateObject var background: GradientBackground
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

            HStack {
                VStack {
                    HStack {
                        Text("Click interval (in milliseconds):")

                        Spacer()
                    }

                    NumberField(text: "Click interval", min: 0, max: 1000, number: self.$clickIntervalInMilliseconds)
                        .disabled(self.autoClickSimulator.isAutoClicking || self.delayTimer.isCountingDown)
                }
                .padding(.trailing)

                VStack {
                    HStack {
                        Text("Amount of clicks:")

                        Spacer()
                    }

                    NumberField(text: "Amount of clicks", min: 0, max: 10000, number: self.$amountOfClicks)
                        .disabled(self.autoClickSimulator.isAutoClicking || self.delayTimer.isCountingDown)
                }
            }
            .padding(.bottom, 15)

            HStack {
                VStack {
                    HStack {
                        Text("Remaining clicks:")

                        Spacer()
                    }

                    TextField("Remaining clicks", value: self.$autoClickSimulator.remainingClicks, formatter: NumberFormatter())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .disabled(true)
                }
                .padding(.trailing)

                VStack {
                    HStack {
                        Text("Currently clicking at:")

                        Spacer()
                    }

                    TextField("Currently clicking at", text: self.$autoClickSimulator.clickingAt)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .disabled(true)
                }
            }

            Spacer()

            Toggle("Delayed start", isOn: self.$delayTimer.delayedStart)
                .disabled(self.autoClickSimulator.isAutoClicking || self.delayTimer.isCountingDown)
                .padding(.bottom, 20)

            HStack {
                VStack {
                    Button(self.delayTimer.startButtonText, action: self.startStub)
                        .disabled(self.autoClickSimulator.isAutoClicking || self.delayTimer.isCountingDown)
                        .keyboardShortcut("s", modifiers: [.command])
                        .buttonStyle(StopwatchButtonStyle())

                    Text("⌘S")
                        .foregroundColor(.secondary)
                        .shadow(radius: 4)
                }

                VStack {
                    Button("Stop", action: self.autoClickSimulator.stop)
                        .disabled(!self.autoClickSimulator.isAutoClicking)
                        .keyboardShortcut("x", modifiers: [.command])
                        .buttonStyle(StopwatchButtonStyle())

                    Text("⌘X")
                        .foregroundColor(.secondary)
                        .shadow(radius: 4)
                }
            }
            .padding(.bottom, 25)

            Text("with ♥️ by Othyn")
                .font(.system(size: 11, weight: .medium, design: .rounded))
                .onTapGesture(perform: self.background.randomise)
        }
        .padding()
    }
}
