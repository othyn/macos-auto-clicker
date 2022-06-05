<div align="center">
    <img src="art/icon/fragments/Icon-1024.png" alt="logo" width="250" height="auto" />
    <h1>Auto Clicker for macOS</h1>
    <p>A simple auto clicker for macOS Big Sur (11) and Monterey (12), built with ♥️ in Swift 5 & SwiftUI.</p>
</div>

<div align="center">
    <p>
        <a href="https://github.com/othyn/macos-auto-clicker/actions/workflows/swiftlint.yml">
            <img src="https://github.com/othyn/macos-auto-clicker/actions/workflows/swiftlint.yml/badge.svg" alt="lint" />
        </a>
        <!-- <a href="https://github.com/othyn/macos-auto-clicker/actions/workflows/xcode.yml">
            <img src="https://github.com/othyn/macos-auto-clicker/actions/workflows/xcode.yml/badge.svg" alt="build" />
        </a> -->
        <a href="https://github.com/othyn/macos-auto-clicker/releases">
            <img src="https://img.shields.io/github/downloads/othyn/macos-auto-clicker/total" alt="lint" />
        </a>
        <a href="https://github.com/othyn/macos-auto-clicker/graphs/contributors">
            <img src="https://img.shields.io/github/contributors/othyn/macos-auto-clicker" alt="contributors" />
        </a>
        <a href="https://github.com/othyn/macos-auto-clicker/network/members">
            <img src="https://img.shields.io/github/forks/othyn/macos-auto-clicker" alt="forks" />
        </a>
        <a href="https://github.com/othyn/macos-auto-clicker/stargazers">
            <img src="https://img.shields.io/github/stars/othyn/macos-auto-clicker" alt="stars" />
        </a>
        <a href="https://github.com/othyn/macos-auto-clicker/issues/">
            <img src="https://img.shields.io/github/issues/othyn/macos-auto-clicker" alt="open issues" />
        </a>
        <a href="https://github.com/othyn/macos-auto-clicker/blob/master/LICENSE">
            <img src="https://img.shields.io/github/license/othyn/macos-auto-clicker.svg" alt="license" />
        </a>
    </p>
</div>

<div align="center">
    <h4>
        <a href="https://github.com/othyn/macos-auto-clicker/releases/download/v1.3.1/Auto.Clicker.dmg">Download Latest Version</a>
        <span> · </span>
        <a href="https://github.com/othyn/macos-auto-clicker/issues">Report Bug</a>
        <span> · </span>
        <a href="https://github.com/othyn/macos-auto-clicker/issues">Request Feature</a>
    </h4>
</div>

<br />

<!-- Table of Contents -->

# :notebook_with_decorative_cover: Table of Contents

- [About the Project](#star2-about-the-project)
  - [Screenshots](#camera-screenshots)
  - [Tech Stack](#space_invader-tech-stack)
  - [Features](#dart-features)
- [Getting Started](#toolbox-getting-started)
  - [Download](#floppy_disk-download)
  - [Development](#gear-development)
  <!-- - [Running Tests](#test_tube-running-tests) -->
  - [Builds](#triangular_flag_on_post-builds)
- [Roadmap](https://github.com/users/othyn/projects/1)
- [Changelog](https://github.com/othyn/macos-auto-clicker/releases)
- [License](#warning-license)
- [Acknowledgements](#gem-acknowledgements)

<!-- About the Project -->

## :star2: About the Project

All the auto clickers out there were either really outdated, old, buggy and/or have legacy code bases. This one aims to fix all that giving you flexibility and style. Plus, I get to write in easter eggs, who says love can't be colourful.

<!-- Screenshots -->

### :camera: Screenshots

<div align="center">
    <img alt="screenshot" src="art/screenshot.png" width="70%" />
</div>

<!-- TechStack -->

### :space_invader: Tech Stack

<ul>
    <li>Swift</li>
    <li>Swift UI</li>
    <li>Package: <a href="https://github.com/sindresorhus/KeyboardShortcuts">sindresorhus/KeyboardShortcuts</a></li>
    <li>Package: <a href="https://github.com/sindresorhus/Defaults">sindresorhus/Defaults</a></li>
    <li>Package: <a href="https://github.com/othyn/DateStrings">othyn/DateStrings</a></li>
</ul>

<!-- Features -->

### :dart: Features

- An auto clicker of mouse buttons and presser of keyboard keys!
- Allows for pressing or clicking;
  - ... of any mouse or keyboard button
  - ... at a given interval
  - ... for a given amount of presses per interval
  - ... for a given amount of times
  - ... after a delayed start
- Custom keyboard shortcuts to start and stop the clicking or pressing globally
- Option to keep the window on top for easy access
- Persists all your options between sessions
- Fresh and modern UI/UX
- Lots of colour schemes to suit what ever you prefer

<!-- Getting Started -->

## :toolbox: Getting Started

<!-- Download -->

### :floppy_disk: Download

Download: [v1.3.1](https://github.com/othyn/macos-auto-clicker/releases/download/v1.3.1/Auto.Clicker.dmg)

**When first using the app, you will need to right click the app and click 'Open', then on the macOS popup window select 'Open' again to trust this version of the app going forward.** This is as at the moment I don't have a paid Apple developer account in order to notarize the app.

**For more downloads**, checkout the [releases page](https://github.com/othyn/macos-auto-clicker/releases) for app downloads of any version you want to use, even pre-release builds too. There is also a compiled app binary in `dist` directory ready for use.

<!-- Development -->

### :gear: Development

As simple as cloning the project and opening it in Xcode! Make sure you open the project via the `*.xcworkspace` Workspace.

Remember to install the Swift package dependencies once you've opened it for the first time too.

Build and run through Xcode as you normally would to a macOS target. As a note, the build 'number' will automatically be set to the latest short commit hash when the application is built.

This is a side project, so feel free to submit a PR for any functionality/bug fixes and go ham. There aren't any contributing guidelines as of yet, code style is handled by `swiftlint` (`$ brew install swiftlint`) and should automatically fix the style upon build (there is a GH Action setup for this also).

<!-- Running Tests -->

<!-- ### :test_tube: Running Tests

To run tests, run the following command

```bash
  yarn test test
``` -->

<!-- Builds -->

### :triangular_flag_on_post: Builds

I've tried to automate much of the build process behind scripts for the sake of ease and introducing better CD pipelines in the future.

#### App

To build the release version of the app, run `./release`. This will do a clean release build of the app and publish it to `dist/Auto Clicker.app`, along with building the DMG to `dist/Auto Clicker.dmg`.

#### Icons

If the icon is updated in Figma, export the fragments from Figma using the Export option which will export each required size to PNG. Save these into the `art/icon/fragments` folder.

Once done, update the icon images with their relevant size counterpart in Xcode `Build Assets/Assets.xcassets/AppIcon`.

To build the required `.icns` icon file that is bundled with the DMG output, run `art/icon/build`. This should generate a refreshed `art/icon/AutoClicker.icns` that will then be picked up when a new DMG is built.

<!-- License -->

## :warning: License

Distributed under the MIT License. See [LICENSE](https://github.com/othyn/macos-auto-clicker/blob/main/LICENSE) for more information.

<!-- Acknowledgments -->

## :gem: Acknowledgements

Use this section to mention useful resources and libraries that you have used in your projects.

- Readme: [shields.io](https://shields.io/)
- Readme: [ikatyang/emoji-cheat-sheet](https://github.com/ikatyang/emoji-cheat-sheet)
- Readme: [Louis3797/awesome-readme-template](https://github.com/Louis3797/awesome-readme-template)
- Package: [sindresorhus/KeyboardShortcuts](https://github.com/sindresorhus/KeyboardShortcuts)
- Package: [sindresorhus/Defaults](https://github.com/sindresorhus/Defaults)
- Package: [othyn/DateStrings](https://github.com/othyn/DateStrings)
