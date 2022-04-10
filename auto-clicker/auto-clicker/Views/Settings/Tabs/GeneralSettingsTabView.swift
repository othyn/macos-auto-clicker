//
//  GeneralSettingsTabView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 30/03/2022.
//

import Foundation
import SwiftUI

private class ZoopHelper: ObservableObject {
    private static let maximumZoops: Int = 7
    private static let zoopDefault: String = "😴"
    private static let zoopVariants: [String] = [
        "👉😎👉",
        "👈😎👈"
    ]

    @Published var zoopTimer: Timer?
    @Published var zoopLoop: Int = 0
    @Published var zoopText: String = zoopDefault

    func startZooping() {
        self.zoopTimer = Timer.scheduledTimer(timeInterval: 0.25,
                                              target: self,
                                              selector: #selector(getZoopedNerd(timer:)),
                                              userInfo: nil,
                                              repeats: true)
    }

    @objc func getZoopedNerd(timer: Timer) {
        withAnimation {
            guard self.zoopLoop <= ZoopHelper.maximumZoops else {
                self.zoopLoop = 0
                self.zoopText = ZoopHelper.zoopDefault

                self.zoopTimer?.invalidate()

                return
            }

            self.zoopText = ZoopHelper.zoopVariants[self.zoopLoop % ZoopHelper.zoopVariants.count] + " zoop"

            self.zoopLoop += 1
        }
    }
}

struct GeneralSettingsTabView: View {
    @StateObject private var zoopHelper = ZoopHelper()

    var body: some View {
        Form {
            Button(self.zoopHelper.zoopText, action: self.zoopHelper.startZooping)
                .buttonStyle(.plain)
                .font(.system(size: 32, weight: .medium))
        }
    }
}

struct GeneralSettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralSettingsTabView()
    }
}
