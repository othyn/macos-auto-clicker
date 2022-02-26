# Auto Clicker for macOS

A simple auto clicker for macOS Big Sur (11) and Monterey (12), built with ♥️ in Swift 5 & SwiftUI.

<p align="middle">
    <img alt="screenshot" src="art/screenshot.png" width="70%" />
</p>

### Why tho?

All the auto clickers out there were either really outdated, old, buggy and/or have legacy code bases. So, given how simple they are to make, I figured I'd give it a shot, at whipped this up in an evening or two with the aim to make something more modern and maintainable. Plus, I get to write in easter eggs, who says love can't be colourful.

---

## Index

- [Usage](#usage)
- [Development](#development)
- [Testing](#testing)
- [Todo](#todo)
- [Changelog](#changelog)

---

## Usage

There is a compiled app binary in `dist` ready for use, but at the moment its unsigned as I don't have a paid dev cert, so it may not work for you. If thats the case, clone the project and build a copy using your own dev cert as you would any normal xcode project.

### macOS Permissions

The app requires Accessibility permissions to be granted in order to enable the click functionality, without it the app won't be able to click and will appear to be doing nothing. You should be automatically prompted by macOS to enable this, so to enable it;

1. Open System Preferences
2. Click 'Security & Privacy'
3. Click the padlock in the bottom right to make changes
4. Select 'Accessibility' from the left side list
5. Click the plus button at the bottom left of the list and find the `Auto Clicker.app` file to add it to the list _if it doesn't already appear in the list_
6. Click the checkbox to the left of the 'Auto Clicker' app to check it if its not already checked
7. Restart the 'Auto Clicker' app

---

## Development

This is a side project, so feel free to submit a PR for any functionality/bug fixes and go ham. There aren't any contributing guidelines or code styles as of yet.

Make sure you open the project via the `*.xcworkspace` Workspace.

### macOS Permissions

I ended up doing [a post on StackOverflow](https://stackoverflow.com/a/71276964/4494375) as there were no answers to this question already, but I was having issues with app permissions during development. Found a way to do this after some trial and error, navigating through Xcode's (>11, currently 13) new build system.

1. Open System Preferences
2. Click 'Security & Privacy'
3. Click the padlock in the bottom right to make changes
4. Select 'Accessibility' from the left side list
5. Click the plus button at the bottom left of the list and find the `Auto Clicker.app` file to add it to the list that we put within the project directory, this should be something like `$GIT_CLONE_DIR/macos-auto-clicker/auto-clicker/derived_data/auto-clicker/Build/Products/Debug/Auto Clicker.app`
6. Click the checkbox to the left of the 'Auto Clicker' app to check it if its not already checked
7. Restart the 'Auto Clicker' app

Any builds should now have the relevant permissions.

Just to note though, this will overwrite the permissions of any archived/prod builds as the app names and binaries are the same. They are easily added back though, just delete the permission for the build app and instead point it back at your prod app, usually in `/Applications`.

---

## Testing

Hey00000, this needs implementing.

---

## Todo

- Dev cert from a paid dev account so I can sign the app!
- Add global shortcuts (when app is not in focus), as the shortcuts currently only work in-app. Now I have AppDelegate hooks, I should be able to re-install `soffes/HotKey` via SPM and get them setup, making sure to place it somewhere where it won't get garbage collected
- Semver auto version bumping and build numbers (see my ios-chronoscape repo)
- Tests
- Customise keybinds
- `brew` support
- 'Keep ontop' option
- Menu bar mode/move app to menu bar popup

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
