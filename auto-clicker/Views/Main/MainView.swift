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

    @StateObject private var autoClickSimulator = AutoClickSimulator.shared
    @StateObject private var delayTimer = DelayTimer.shared

    @State private var showThemeName = false

    var hasStarted: Bool {
        self.autoClickSimulator.isAutoClicking || self.delayTimer.isCountingDown
    }

    var hasStopped: Bool {
        !self.autoClickSimulator.isAutoClicking && !self.delayTimer.isCountingDown
    }

    var estNextClickAt: Date {
        .init(timeInterval: self.formState.pressIntervalDuration.asTimeInterval(interval: self.formState.pressInterval),
              since: .init())
    }

    var estFinalClickAt: Date {
        .init(timeInterval: self.formState.pressIntervalDuration.asTimeInterval(interval: self.formState.pressInterval * self.formState.repeatAmount),
              since: .init())
    }

    func start() {
        if !self.hasStarted {
            self.delayTimer.start(onFinish: self.autoClickSimulator.start)
            MenuBarService.changeImageColour(newColor: .systemOrange)
        }
    }

    func stop() {
        self.delayTimer.stop()
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
                    Text("main_window_every", comment: "Main window 'Every'")

                    Picker("Interval Mode", selection: self.$formState.intervalMode) {
                        Text("Static").tag(IntervalMode.staticInterval)
                        Text("Range").tag(IntervalMode.rangeInterval)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 120)
                    .disabled(self.hasStarted)

                    if self.formState.intervalMode == .staticInterval {
                        DynamicWidthNumberField(text: "",
                                                min: MIN_PRESS_INTERVAL,
                                                max: MAX_PRESS_INTERVAL,
                                                number: self.$formState.pressInterval)
                            .disabled(self.hasStarted)
                        DurationSelector(selectedDuration: self.$formState.pressIntervalDuration)
                            .disabled(self.hasStarted)
                        Text("main_window_comma", comment: "Main window comma")
                    } else {
                        DynamicWidthNumberField(text: "Min",
                                                min: MIN_PRESS_INTERVAL,
                                                max: MAX_PRESS_INTERVAL,
                                                number: Binding(get: { self.formState.pressIntervalMin ?? DEFAULT_PRESS_INTERVAL_MIN }, set: { self.formState.pressIntervalMin = $0 }))
                            .disabled(self.hasStarted)
                        Text("main_window_to", comment: "Range separator 'to'")
                        DynamicWidthNumberField(text: "Max",
                                                min: MIN_PRESS_INTERVAL,
                                                max: MAX_PRESS_INTERVAL,
                                                number: Binding(get: { self.formState.pressIntervalMax ?? DEFAULT_PRESS_INTERVAL_MAX }, set: { self.formState.pressIntervalMax = $0 }))
                            .disabled(self.hasStarted)
                        DurationSelector(selectedDuration: self.$formState.pressIntervalDuration)
                            .disabled(self.hasStarted)
                        Text("main_window_comma", comment: "Main window comma")
                    }

                    Text("main_window_comma", comment: "Main window comma")
                }

                ActionStageLine {
                    Text("main_window_press", comment: "Main window 'press'")

                    PressKeyListener()
                        .disabled(self.hasStarted)

                    DynamicWidthNumberField(text: "",
                                            min: MIN_PRESS_AMOUNT,
                                            max: MAX_PRESS_AMOUNT,
                                            number: self.$formState.pressAmount)
                        .disabled(self.hasStarted)

                    Text(self.formState.pressAmount == 1 ? "main_window_time" : "main_window_times", comment: "Main window 'time(s)'") + Text("main_window_comma", comment: "Main window comma")
                }

                ActionStageLine {
                    Text("main_window_repeat", comment: "Main window 'repeat'")

                    DynamicWidthNumberField(text: "",
                                            min: MIN_REPEAT_AMOUNT,
                                            max: MAX_REPEAT_AMOUNT,
                                            number: self.$formState.repeatAmount)
                        .disabled(self.hasStarted)

                    Text(self.formState.repeatAmount == 1 ? "main_window_time" : "main_window_times", comment: "Main window 'time(s)'") + Text("main_window_full_stop", comment: "Main window full stop")
                }

                ActionStageLine {
                    Text("main_window_wait", comment: "Main window 'Wait'")

                    DynamicWidthNumberField(text: "",
                                            min: MIN_START_DELAY,
                                            max: MAX_START_DELAY,
                                            number: self.$formState.startDelay)
                        .disabled(self.hasStarted)

                    Text(self.formState.startDelay == 1 ? "main_window_second" : "main_window_seconds", comment: "Main window 'second(s)'") + Text("main_window_before_starting", comment: "Main window 'before starting'") + Text("main_window_full_stop", comment: "Main window full stop")
                }
            }
            .padding(.top, 20)
            .padding(.leading, 20)
            .padding(.bottom, 20)

            // MARK: - Buttons

            HStack {
                VStack {
                    Button(action: self.start) {
                        if self.hasStarted {
                            Text(self.delayTimer.countdownText).kerning(1)
                        } else {
                            Text("main_window_start_btn", comment: "Main window start button").kerning(1)
                        }
                    }
                    .disabled(self.hasStarted)
                    .buttonStyle(ThemedButtonStyle())

                    KeyboardShortcutHint(shortcut: KeyboardShortcuts.Name.pressStartButton.shortcut ?? KeyboardShortcuts.Name.pressStartButton.defaultShortcut!)
                }

                VStack {
                    Button(action: self.stop) {
                        Text("main_window_stop_btn", comment: "Main window stop button").kerning(1)
                    }
                    .disabled(self.hasStopped)
                    .buttonStyle(ThemedButtonStyle())

                    KeyboardShortcutHint(shortcut: KeyboardShortcuts.Name.pressStopButton.shortcut ?? KeyboardShortcuts.Name.pressStopButton.defaultShortcut!)
                }

                Spacer()
            }
            .padding(.leading, 20)

            // MARK: - Spacer

            Spacer()

            // MARK: - Stats

            VStack {
                HStack {
                    Spacer()

                    StatBox(title: "main_window_stat_box_next_press_at",
                            value: self.hasStarted
                                   ? self.autoClickSimulator.nextClickAt.asString(inFormat: "yyyy-MM-dd HH:mm:ss.SSS")
                                   : self.estNextClickAt.asString(inFormat: "yyyy-MM-dd HH:mm:ss.SSS"))

                    Spacer()

                    StatBox(title: "main_window_stat_box_final_press_at",
                            value: self.hasStarted
                                   ? self.autoClickSimulator.finalClickAt.asString(inFormat: "yyyy-MM-dd HH:mm:ss.SSS")
                                   : self.estFinalClickAt.asString(inFormat: "yyyy-MM-dd HH:mm:ss.SSS"))

                    Spacer()
                }
                .padding(.top, 18)
                .padding(.bottom, 10)

                // MARK: - Pretty Text

                HStack {
                    if self.showThemeName {
                        Text(self.activeTheme.currentColour.localised, comment: "Colour Enum")
                            .font(.system(size: 10, weight: .medium, design: .rounded))
                            .foregroundColor(self.activeTheme.backgroundColour.lighter)
                            .padding(.trailing, -5)
                    }

                    Text("main_window_repo_vanity", comment: "Main window repo vanity plate")
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
