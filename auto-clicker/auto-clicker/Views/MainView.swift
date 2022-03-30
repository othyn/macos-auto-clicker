//
//  MainView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 12/05/2021.
//

import SwiftUI
import DateStrings

struct MainView: View {

    @StateObject var background: GradientBackground
    @StateObject var autoClickSimulator: AutoClickSimulator = AutoClickSimulator()
    @StateObject var delayTimer: DelayTimer = DelayTimer()

    // Some weird behaviour on macOS 11.2.3 and Swift 5 causes the app to hang on launch with these published and being passed through to View Bindings
    @State private var selectedClickInterval: Duration = Duration.milliseconds
    @State private var clickInterval: Int = DEFAULT_CLICK_INTERVAL_IN_MILLISECONDS
    @State private var amountOfClicks: Int = DEFAULT_CLICK_AMOUNT
    @State private var startDelayInSeconds: Int = DEFAULT_START_DELAY_IN_SECONDS

    // Stubbing methods to work around the weird hang issue
    func startStub() -> Void {
        self.delayTimer.start(delayInSeconds: self.startDelayInSeconds, onFinish: {
            self.autoClickSimulator.start(duration: self.selectedClickInterval,
                                          interval: self.clickInterval,
                                          iterations: self.amountOfClicks)
        })
    }

    var body: some View {
        VStack {

            HStack {
                VStack {
                    HStack {
                        Text("Click interval:")

                        Spacer()
                    }

                    NumberField(text: "Click interval",
                                min: MIN_CLICK_INTERVAL,
                                max: MAX_CLICK_INTERVAL,
                                number: self.$clickInterval)
                        .disabled(self.autoClickSimulator.isAutoClicking || self.delayTimer.isCountingDown)
                }
                
                Picker("", selection: self.$selectedClickInterval) {
                    ForEach(Duration.allCases) { unit in
                        unit.textView.tag(unit)
                    }
                }
                .disabled(self.autoClickSimulator.isAutoClicking || self.delayTimer.isCountingDown)
            }
            .padding(.bottom, 10)
            
            HStack {
                VStack {
                    HStack {
                        Text("Amount of clicks:")

                        Spacer()
                    }

                    NumberField(text: "Amount of clicks",
                                min: MIN_CLICK_AMOUNT,
                                max: MAX_CLICK_AMOUNT,
                                number: self.$amountOfClicks)
                        .disabled(self.autoClickSimulator.isAutoClicking || self.delayTimer.isCountingDown)
                }
                .padding(.trailing)
                
                VStack {
                    HStack {
                        Text("Start delay (in seconds):")

                        Spacer()
                    }

                    // I don't like this at all, rather tap straight into the published property, but I'm still having the same
                    // hanging issues on macOS 12.2.1
                    NumberField(text: "Start delay",
                                min: MIN_START_DELAY,
                                max: MAX_START_DELAY,
                                number: self.$startDelayInSeconds)
                        .disabled(self.autoClickSimulator.isAutoClicking || self.delayTimer.isCountingDown)
                }
            }
            .padding(.bottom, 25)

            HStack {
                VStack {
                    HStack {
                        Text("Remaining clicks:")

                        Spacer()
                    }
                    .padding(.bottom, 1)
                    
                    HStack {
                        Text(String(self.autoClickSimulator.remainingClicks))
                            .foregroundColor(.gray)
                        
                        Spacer()
                    }
                }
                .padding(.trailing)

                VStack {
                    HStack {
                        Text("Currently clicking at:")

                        Spacer()
                    }
                    .padding(.bottom, 1)
                    
                    HStack {
                        Text(self.autoClickSimulator.clickingAt)
                            .foregroundColor(.gray)
                        
                        Spacer()
                    }
                }
            }
            .padding(.bottom, 10)
            
            HStack {
                VStack {
                    HStack {
                        Text("Next click at:")

                        Spacer()
                    }
                    .padding(.bottom, 1)
                    
                    HStack {
                        Text(self.autoClickSimulator.isAutoClicking || self.delayTimer.isCountingDown
                             ? self.autoClickSimulator.nextClickAt.asString(inFormat: "yyyy-MM-dd HH:mm:ss.SSS")
                             : "N/A")
                            .foregroundColor(.gray)
                        
                        Spacer()
                    }
                }
                .padding(.trailing)

                VStack {
                    HStack {
                        Text("Final click at:")

                        Spacer()
                    }
                    .padding(.bottom, 1)
                    
                    HStack {
                        Text(self.autoClickSimulator.isAutoClicking || self.delayTimer.isCountingDown
                             ? self.autoClickSimulator.finalClickAt.asString(inFormat: "yyyy-MM-dd HH:mm:ss.SSS")
                             : "N/A")
                            .foregroundColor(.gray)
                        
                        Spacer()
                    }
                }
            }

            Spacer()

            HStack {
                VStack {
                    Button(action: self.startStub) {
                        Text(self.delayTimer.startButtonText.uppercased()).kerning(1)
                    }
                    .disabled(self.autoClickSimulator.isAutoClicking || self.delayTimer.isCountingDown)
                    .keyboardShortcut("s", modifiers: [.command])
                    .buttonStyle(
                        StopwatchButtonStyle(lightColour: Color(.sRGB, red: 139/255, green: 198/255, blue: 60/255, opacity: 1.0),
                                             darkColour: Color(.sRGB, red: 107/255, green: 165/255, blue: 46/255, opacity: 1.0))
                    )

                    Text("⌘S")
                        .foregroundColor(.secondary)
                }
                .padding(.trailing)

                VStack {
                    Button(action: self.autoClickSimulator.stop) {
                        Text("stop".uppercased()).kerning(1)
                    }
                    .disabled(!self.autoClickSimulator.isAutoClicking)
                    .keyboardShortcut("x", modifiers: [.command])
                    .buttonStyle(
                        StopwatchButtonStyle(lightColour: Color(.sRGB, red: 239/255, green: 53/255, blue: 65/255, opacity: 1.0),
                                             darkColour: Color(.sRGB, red: 223/255, green: 17/255, blue: 30/255, opacity: 1.0))
                    )

                    Text("⌘X")
                        .foregroundColor(.secondary)
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
