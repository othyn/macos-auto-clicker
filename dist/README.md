How to build a .dmg to distribute MacOS apps

To release a MacOS app through the Mac App Store, there is an integrated wizard in Xcode. Distributing your MacOS app outside the Mac App Store is less documented.

Open your project in Xcode. Do Product > Archive. This brings up the project organizer with a list of archives. So far, this is the same as releasing through the Mac App Store. But instead of clicking "Upload to App Store ...", click "Export...". Then select "Export a Developer ID-signed Application". (You want your package to be signed with your Developer ID when distributing outside the App Store; MacOS's "gatekeeper" policy can disallow unsigned applications.) Allow codesign access to your keychain. Select a location to export to.

This gives you a .app, such as Vidrio.app. Next, you need to package this as a .dmg (disk image). You can do this manually using Disk Image, or programmatically using node-appdmg.

Source: [https://jameshfisher.com/2017/08/12/xcode-build-dmg-for-distribution-macos/](https://jameshfisher.com/2017/08/12/xcode-build-dmg-for-distribution-macos/)
