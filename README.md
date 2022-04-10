# Auto Clicker for macOS

[![Lint](https://github.com/othyn/macos-auto-clicker/actions/workflows/swiftlint.yml/badge.svg)](https://github.com/othyn/macos-auto-clicker/actions/workflows/swiftlint.yml)
[![Build](https://github.com/othyn/macos-auto-clicker/actions/workflows/xcode.yml/badge.svg)](https://github.com/othyn/macos-auto-clicker/actions/workflows/xcode.yml)

A simple auto clicker for macOS Big Sur (11) and Monterey (12), built with ♥️ in Swift 5 & SwiftUI.

<p align="middle">
    <img alt="screenshot" src="art/screenshot.png" width="70%" />
</p>

<p align="middle">
    <sub>Press the ♥️ for a variety of colours, a few of the ones available are shown in the screenshot above!</sub>
</p>

### Why tho?

All the auto clickers out there were either really outdated, old, buggy and/or have legacy code bases. This one aims to fix all that giving you flexibility and style. Plus, I get to write in easter eggs, who says love can't be colourful.

---

## Index

- [Downloads](#downloads)
- [Development](#development)
- [Testing](#testing)
- [Changelog](#changelog)

---

## Downloads

Checkout the [releases page](https://github.com/othyn/macos-auto-clicker/releases) for direct App downloads. Here you can find the latest stable release and any pre-release builds too. There is also a compiled app binary in `dist` directory ready for use.

### Note

You may recieve a popup when first using the app that the app cannot be verified, this is as at the moment I don't have a paid Apple developer account so I cannot notarize the app. When first using the app, you may need to right click and select the 'Open' option to provide a prompt that will allow you to trust the app going forward and to open it as normal.

---

## Development

This is a side project, so feel free to submit a PR for any functionality/bug fixes and go ham. There aren't any contributing guidelines as of yet, code style is handled by `swiftlint` (`$ brew install swiftlint`) and should automatically fix the style upon build (there is a GH Action setup for this also).

Make sure you open the project via the `*.xcworkspace` Workspace.

---

## Testing

Hey00000, this needs implementing.

---

## Changelog

Any and all project changes for releases should be documented below. Versioning follows the [SemVer](https://semver.org/) standard.

---

### Version 1.2.0

Various functionality tweaks alongside UI/UX changes.

#### Added

- Added a Workspace `auto-clicker.xcworkspace` that should be worked from which allows for easier local relative build paths so permissions can be given more easily to allow for clicking functionality to work
- Click interval is now measured in selectable; Milliseconds, Seconds, Minutes and Hours. This makes the click interval selection much more intuitive
- There are now two more readouts for 'Next click at' and 'Final click at' that will show what date/time the next and final clicks will occur at
- Instructions to this README on setting up macOS permissions that the app requires

#### Changed

- Updated `dist/README.md` with new instructions for Xcode 13
- Updated button styling to be more visually appealing and easier to read
- Upped the maximum amount of clicks to 100,000,000 to allow for a 'virtually unlimited' mode
- Instead of a checkbox, the start delay is now a user inputted variable between 0 (instant) and 60 seconds
- The 'Remaining clicks' and 'Currently clicking at' UI elements are now Text View's instead of disabled TextField's
- Updated screenshot with new UI

#### Fixed

- Nothing

#### Removed

- Nothing

---

### Version 1.1.0

This should have been a patch release, but I don't have the build suite quite setup for it yet so its a minor release instead.

#### Added

- Easter egg!

#### Changed

- Minor code refactor and tidy up
- UI overhaul
- Shortcuts for the commands are now displayed underneath the buttons instead of in placeholder fields

#### Fixed

- Nothing

#### Removed

- Nothing

---

### Version 1.0.0

Initial release.

#### Added

- Everything

#### Changed

- Everything

#### Fixed

- Everything

#### Removed

- Everything
