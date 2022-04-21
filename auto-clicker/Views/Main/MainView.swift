//
//  MainView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 27/03/2022.
//

import SwiftUI
import DateStrings
import KeyboardShortcuts
import Defaults

struct MainView: View {
    @Default(.appearanceSelectedTheme) private var activeTheme
    @Default(.autoClickerState) private var formState

    @StateObject private var autoClickSimulator = AutoClickSimulator()
    @StateObject private var delayTimer = DelayTimer()

    @State private var showThemeName = false

    var estNextClickAt: Date {
        .init(timeInterval: self.formState.pressIntervalDuration.asTimeInterval(interval: self.formState.pressInterval),
              since: .init())
    }

    var estFinalClickAt: Date {
        .init(timeInterval: self.formState.pressIntervalDuration.asTimeInterval(interval: self.formState.pressInterval * self.formState.repeatAmount),
              since: .init())
    }

    func start() {
        self.delayTimer.start(onFinish: self.autoClickSimulator.start)
    }

    func stop() {
        self.autoClickSimulator.stop()
    }

    func registerKeyboardShortcuts() {
        KeyboardShortcuts.onKeyUp(for: .pressStartButton) { [self] in
            self.start()
        }

        KeyboardShortcuts.onKeyUp(for: .pressStopButton) { [self] in
            self.stop()
        }
    }

    func changeColour() {
        self.activeTheme.randomise()

        withAnimation {
            self.showThemeName = true
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                self.showThemeName = false
            }
        }
    }

    var body: some View {
        VStack {
            // MARK: - Action Stage

            VStack {
                ActionStageLine {
                    Text("Every")

                    DynamicWidthNumberField(text: "",
                                            min: MIN_PRESS_INTERVAL,
                                            max: MAX_PRESS_INTERVAL,
                                            number: self.$formState.pressInterval)
                        .disabled(self.autoClickSimulator.isAutoClicking || self.delayTimer.isCountingDown)

                    DurationSelector(selectedDuration: self.$formState.pressIntervalDuration)
                        .disabled(self.autoClickSimulator.isAutoClicking || self.delayTimer.isCountingDown)

                    Text(",")
                }

                ActionStageLine {
                    Text("press '")

                    PressKeyListener()
                        .disabled(self.autoClickSimulator.isAutoClicking || self.delayTimer.isCountingDown)

                    Text("'")

                    DynamicWidthNumberField(text: "",
                                            min: MIN_PRESS_AMOUNT,
                                            max: MAX_PRESS_AMOUNT,
                                            number: self.$formState.pressAmount)
                        .disabled(self.autoClickSimulator.isAutoClicking || self.delayTimer.isCountingDown)

                    Text("\(self.formState.pressAmount == 1 ? "time" : "times"),")
                }

                ActionStageLine {
                    Text("repeat")

                    DynamicWidthNumberField(text: "",
                                            min: MIN_REPEAT_AMOUNT,
                                            max: MAX_REPEAT_AMOUNT,
                                            number: self.$formState.repeatAmount)
                        .disabled(self.autoClickSimulator.isAutoClicking || self.delayTimer.isCountingDown)

                    Text("\(self.formState.repeatAmount == 1 ? "time" : "times").")
                }

                ActionStageLine {
                    Text("Wait")

                    DynamicWidthNumberField(text: "",
                                            min: MIN_START_DELAY,
                                            max: MAX_START_DELAY,
                                            number: self.$formState.startDelay)
                        .disabled(self.autoClickSimulator.isAutoClicking || self.delayTimer.isCountingDown)

                    Text("\(self.formState.startDelay == 1 ? "second" : "seconds") before starting.")
                }
            }
            .padding(.top, 20)
            .padding(.leading, 20)
            .padding(.bottom, 20)

            // MARK: - Buttons

            HStack {
                VStack {
                    Button(action: self.start) {
                        Text(self.delayTimer.startButtonText.uppercased()).kerning(1)
                    }
                    .disabled(self.autoClickSimulator.isAutoClicking || self.delayTimer.isCountingDown)
                    .buttonStyle(ThemedButtonStyle())

                    KeyboardShortcutHint(shortcut: KeyboardShortcuts.Name.pressStartButton.shortcut!)
                }

                VStack {
                    Button(action: self.stop) {
                        Text("STOP").kerning(1)
                    }
                    .disabled(!self.autoClickSimulator.isAutoClicking)
                    .buttonStyle(ThemedButtonStyle())

                    KeyboardShortcutHint(shortcut: KeyboardShortcuts.Name.pressStopButton.shortcut!)
                }

                Spacer()
            }
            .padding(.leading, 20)

            // MARK: - Spacer

            Spacer()

            // MARK: - Stats

            VStack {
                HStack {
//                    Spacer()
//
//                    StatBox(title: "Next press at",
//                            value: "2010-06-07 10:00:00.000")
//
//                    Spacer()
//
//                    StatBox(title: "Final press at",
//                            value: "2010-06-07 12:00:00.000")
//
//                    Spacer()

                    Spacer()

                    StatBox(title: "Next press at",
                            value: self.autoClickSimulator.isAutoClicking || self.delayTimer.isCountingDown
                                   ? self.autoClickSimulator.nextClickAt.asString(inFormat: "yyyy-MM-dd HH:mm:ss.SSS")
                                   : self.estNextClickAt.asString(inFormat: "yyyy-MM-dd HH:mm:ss.SSS"))

                    Spacer()

                    StatBox(title: "Final press at",
                            value: self.autoClickSimulator.isAutoClicking || self.delayTimer.isCountingDown
                                   ? self.autoClickSimulator.finalClickAt.asString(inFormat: "yyyy-MM-dd HH:mm:ss.SSS")
                                   : self.estFinalClickAt.asString(inFormat: "yyyy-MM-dd HH:mm:ss.SSS"))

                    Spacer()
                }
                .padding(.top, 18)
                .padding(.bottom, 10)

                // MARK: - Pretty Text

                HStack {
                    if self.showThemeName {
                        Text(self.activeTheme.rawValue)
                            .font(.system(size: 10, weight: .medium, design: .rounded))
                            .foregroundColor(self.activeTheme.backgroundColour.lighter)
                            .padding(.trailing, -5)
                    }

                    Text("with ♥️ by Othyn")
                        .font(.system(size: 10, weight: .medium, design: .rounded))
                        .foregroundColor(self.activeTheme.backgroundColour.lighter)
                        .onTapGesture(perform: self.changeColour)
                }
                .padding(.bottom, 12)
            }
            .background(self.activeTheme.backgroundColour.darker)
        }
        .onAppear(perform: self.registerKeyboardShortcuts)
    }
}

// struct ActionStageView_Previews: PreviewProvider {
//    static var previews: some View {
//        ActionStageView()
//            .frame(minWidth: WindowSize.width)
//            .frame(maxWidth: WindowSize.width)
//            .padding(10)
//    }
// }
