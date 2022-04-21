<div align="center">
    <img src="art/icon/Icon-1024.png" alt="logo" width="250" height="auto" />
    <h1>Auto Clicker for macOS</h1>
    <p>A simple auto clicker for macOS Big Sur (11) and Monterey (12), built with ♥️ in Swift 5 & SwiftUI.</p>
</div>

<div align="center">
    <p>
        <a href="https://github.com/othyn/macos-auto-clicker/actions/workflows/swiftlint.yml">
            <img src="https://github.com/othyn/macos-auto-clicker/actions/workflows/swiftlint.yml/badge.svg" alt="lint" />
        </a>
        <a href="https://github.com/othyn/macos-auto-clicker/actions/workflows/xcode.yml">
            <img src="https://github.com/othyn/macos-auto-clicker/actions/workflows/xcode.yml/badge.svg" alt="build" />
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
        <a href="https://github.com/othyn/macos-auto-clicker/issues/">Report Bug</a>
        <span> · </span>
        <a href="https://github.com/othyn/macos-auto-clicker/issues/">Request Feature</a>
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
  - [Deployment](#triangular_flag_on_post-deployment)
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

Checkout the [releases page](https://github.com/othyn/macos-auto-clicker/releases) for direct App downloads for the version you want to use. Here you can find the latest stable release and any pre-release builds too. There is also a compiled app binary in `dist` directory ready for use.

You may recieve a popup when first using the app that the app cannot be verified, this is as at the moment I don't have a paid Apple developer account so I cannot notarize the app. When first using the app, you may need to right click and select the 'Open' option to provide a prompt that will allow you to trust the app going forward and to open it as normal.

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

<!-- Deployment -->

### :triangular_flag_on_post: Deployment

With Xcode (currently 13.2.1) open and having it as the foreground app (so it takes over the menu bar with its menu items), do the following:

1. With the project open, ensure the Version and Build are incremented in the `auto-clicker.xcodeproj` 'General' tab under the `auto-clicker` Target on the left
2. Then in the menu bar click 'Product' then 'Archive'
3. This brings up the project organizer with a list of Archives
4. Next with the desired Archive selected, click 'Distribute App'
5. Select 'Copy App' and press 'Next'
6. In the file dialogue, open the `/dist` directory and click 'Export'
7. Navigate to the `/dist` directory in Finder and pull the Archive out of the auto-generated subdirectory and into the root `/dist` directory, overwriting the existing `Auto Clicker.app` with the new `Auto Clicker.app`

I would like to get this automated by a GitHub Action at some point, although its proving challenging!

Further reading can be found here: [https://jameshfisher.com/2017/08/12/xcode-build-dmg-for-distribution-macos/](https://jameshfisher.com/2017/08/12/xcode-build-dmg-for-distribution-macos/)

<!-- License -->

## :warning: License

Distributed under the MIT License. See [LICENSE](https://github.com/othyn/macos-auto-clicker/blob/main/LICENSE) for more information.

<!-- Acknowledgments -->

## :gem: Acknowledgements

Use this section to mention useful resources and libraries that you have used in your projects.

- Readme: [Shields.io](https://shields.io/)
- Readme: [Awesome README](https://github.com/matiassingers/awesome-readme)
- Readme: [Emoji Cheat Sheet](https://github.com/ikatyang/emoji-cheat-sheet/blob/master/README.md#travel--places)
- Readme: [Readme Template](https://github.com/othneildrew/Best-README-Template)
- Package: [sindresorhus/KeyboardShortcuts](https://github.com/sindresorhus/KeyboardShortcuts)
- Package: [sindresorhus/Defaults](https://github.com/sindresorhus/Defaults)
- Package: [othyn/DateStrings](https://github.com/othyn/DateStrings)
