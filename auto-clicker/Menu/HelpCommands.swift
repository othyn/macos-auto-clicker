//
//  HelpCommands.swift
//  auto-clicker
//
//  Created by Ben Tindall on 06/07/2022.
//

import SwiftUI

struct HelpCommands: Commands {
    let ghIssueLink = "https://github.com/othyn/macos-auto-clicker/issues"

    var body: some Commands {
        CommandGroup(replacing: .help, addition: {
            Button("help_commands_request_a_feature") {
                NSWorkspace.shared.open(URL(string: self.ghIssueLink)!)
            }
            Button("help_commands_report_a_bug") {
                NSWorkspace.shared.open(URL(string: self.ghIssueLink)!)
            }
        })
    }
}
