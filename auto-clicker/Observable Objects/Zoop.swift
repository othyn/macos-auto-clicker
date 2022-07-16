//
//  Zoop.swift
//  auto-clicker
//
//  Created by Ben Tindall on 16/07/2022.
//

import Foundation
import SwiftUI

final class Zoop: ObservableObject {
    private static let maximum: Int = 7
    private static let sleep: String = "😴"
    private static let variants: [String] = [
        "👉😎👉",
        "👈😎👈"
    ]

    @Published var timer: Timer?
    @Published var loop: Int = 0
    @Published var text: String = sleep

    func start() {
        self.timer = Timer.scheduledTimer(timeInterval: 0.25,
                                          target: self,
                                          selector: #selector(getZoopedNerd(timer:)),
                                          userInfo: nil,
                                          repeats: true)
    }

    @objc func getZoopedNerd(timer: Timer) {
        withAnimation {
            guard self.loop <= Zoop.maximum else {
                self.loop = 0
                self.text = Zoop.sleep

                self.timer?.invalidate()

                return
            }

            self.text = Zoop.variants[self.loop % Zoop.variants.count] + " zoop"

            self.loop += 1
        }
    }
}
