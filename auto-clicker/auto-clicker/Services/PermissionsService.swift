//
//  PermissionsService.swift
//  auto-clicker
//
//  Created by Ben Tindall on 10/04/2022.
//

import Cocoa

// I had a lot of problems getting all this setup so that the Accessibility permissions were clear and prompted to the user.
// macOS and Xcode have some 'interesting' quirks that impeade the development of this. Mainly that Xcode by default will run
//  in sandboxed mode, meaning native macOS permissions prompts won't fire until thats dissabled in the applications entitlements
//  file. The other is that macOS will not reset or apply the permissions to a new build of the app as the app signature changes
//  for each build, which makes sense but its annoying there isn't a way to automate this during development. The only 'solution'
//  I have yet found is to just use `tccutil` to reset the permissions for the $PRODUCT_BUNDLE_IDENTIFIER as an Xcode build script
//  with the annoyance being that you have to apply the permissions on each app build...
// See: https://stackoverflow.com/a/61890478/4494375

final class PermissionsService {
    static func acquireAccessibilityPrivileges() {
        let options: NSDictionary = [kAXTrustedCheckOptionPrompt.takeRetainedValue() as NSString: true]
        let enabled = AXIsProcessTrustedWithOptions(options)

        #if DEBUG
        if enabled {
            NSLog("App permissions granted")
        } else {
            NSLog("App permissions not granted")
        }
        #endif
    }

    static func pollAccessibilityPrivileges(onPermitted: @escaping () -> Void, onDenied: @escaping () -> Void) {
        #if DEBUG
        NSLog("Is trusted: \(AXIsProcessTrusted())")
        #endif

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            if AXIsProcessTrusted() {
                onPermitted()
            } else {
                onDenied()

                PermissionsService.pollAccessibilityPrivileges(onPermitted: onPermitted, onDenied: onDenied)
            }
        }
    }
}
