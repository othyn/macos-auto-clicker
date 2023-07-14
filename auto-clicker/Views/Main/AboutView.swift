//
//  AboutView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 14/07/2023.
//

import Foundation
import SwiftUI

/**
 * This is the only way to solve visual effects not working in SwiftUI. Its not documented anywhere, the only place online to find this is:
 * https://www.reddit.com/r/SwiftUI/comments/va8ygf/translucent_window_with_transparent_title_bar_in/
 *
 * If you try to use an NSVisualEffectView in the AppDelegate against the NSWindow or any other method, such as the .background(.ultraThinMaterial)
 * on the SwiftUI View, you'll just get a grey background. Finding information on this was near impossible.
 */
struct VisualEffectView: NSViewRepresentable {
    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()

        view.blendingMode = .behindWindow
        view.material = .underWindowBackground
        view.state = .active

        return view
    }

    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {
        //
    }
}

struct AboutView: View {
    var body: some View {
        VStack(spacing: 10) {
            Image(nsImage: NSImage(named: "AppIcon")!)

            Text("\(Bundle.main.appName)")
                .font(.system(size: 28, weight: .bold))
                .multilineTextAlignment(.center)

            Text("\(Bundle.main.appVersionLong) (\(Bundle.main.appBuild))")
                .font(.system(size: 12, weight: .medium))
                .multilineTextAlignment(.center)
                .textSelection(.enabled)
                .padding(.bottom)

            Link("about_url_short", destination: URL(string: String(format: NSLocalizedString("about_url", comment: "About URL")))!)
                .font(.system(size: 12, weight: .regular))
                .multilineTextAlignment(.center)

            Text(Bundle.main.copyright)
                .font(.system(size: 10, weight: .regular))
                .multilineTextAlignment(.center)
        }
        .padding(20)
        .ignoresSafeArea()
        .frame(minWidth: 375, minHeight: 350)
        .background(VisualEffectView().ignoresSafeArea())

        // .ignoresSafeArea() order matters! Otherwise there is dead space under the rendered View
        // https://stackoverflow.com/a/70275484/4494375
    }
}
