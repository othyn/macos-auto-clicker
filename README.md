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
        <a href="https://github.com/othyn/macos-auto-clicker/releases/download/v1.3.2/Auto.Clicker.dmg">Download Latest Version</a>
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
  - [Localisation](#speech_balloon-localisation)
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

Download: [v1.3.2](https://github.com/othyn/macos-auto-clicker/releases/download/v1.3.2/Auto.Clicker.dmg)

**When first using the app, you will need to right click the app and click 'Open', then on the macOS popup window select 'Open' again to trust this version of the app going forward.** This is as at the moment I don't have a paid Apple developer account in order to notarize the app.

**For more downloads**, checkout the [releases page](https://github.com/othyn/macos-auto-clicker/releases) for app downloads of any version you want to use, even pre-release builds too. There is also a compiled app binary in `dist` directory ready for use.

<!-- Development -->

### :gear: Development

As simple as cloning the project and opening it in Xcode! Make sure you open the project via the `*.xcworkspace` Workspace.

Remember to install the Swift package dependencies once you've opened it for the first time too.

Build and run through Xcode as you normally would to a macOS target. As a note, the build 'number' will automatically be set to the latest short commit hash when the application is built.

This is a side project, so feel free to submit a PR for any functionality/bug fixes and go ham. There aren't any contributing guidelines as of yet, code style is handled by `swiftlint` (`$ brew install swiftlint`) and should automatically fix the style upon build. There is a [GitHub Action](.github/workflows/swiftlint.yml) setup to run on all code submitted, so it can't be avoided.

### :speech_balloon: Localisation

This project supports localisation! Please see the pinned [language support issue](https://github.com/othyn/macos-auto-clicker/issues/10) as a discussion place for new language support. See the [`auto-clicker/Localisation`](https://github.com/othyn/macos-auto-clicker/tree/main/auto-clicker/Localisation) project directory to view currently supported languages, the project default being `en-GB`.

The project makes use of the Apple default `Localizable.strings` and `Localizable.stringsdict` to support local translations. See [issue #36](https://github.com/othyn/macos-auto-clicker/issues/36) for some useful links and resources for implementing translations. The short tutorial is;

0. Clone this project locally to somewhere on your machine.
1. Open up the project **workspace** in Xcode.
2. Click on the top level project item in the project file browser sidebar in Xcode.
3. Click on the project under the Project heading.
4. Click on the 'Info' tab.
5. Scroll down to 'Localizations'.
6. Click the plus button at the bottom of the table displaying the current project languages and select the language you intend to provide translations for.
7. On the on screen prompt **change nothing** and just click 'Finish'
8. The new language will appear in the `Localisation` folder as a new version of the `Localizable.strings` file, with the language code identifier along with the file and appearing as the parent directory in the `Localisation` folder. E.g. for France this would be `fr`. You will know if the translation file has been picked up by Xcode as the language will appear with the amount of `Localizable.strings` translation files found by Xcode in that 'Localizations' table mentioned in step 5.
9. Once you have written the translations by providing the appropriate new strings in the language you've chosen as are required by the application, please submit a new PR to merge in the new language as a supported language.

<div align=center>
    <img width="90%" src="art/ref/readme_localisations_guide.jpg"/>
</div>

More information on Apple's localisation practices can be found on [their official docs](https://developer.apple.com/localization/), and [their official docs for Xcode](https://developer.apple.com/documentation/xcode/localization). There is also an application, [`mohakapt/Stringz`](https://github.com/mohakapt/Stringz), who's sole intent is to make writing and maintaining language translations easier. See [issue #36](https://github.com/othyn/macos-auto-clicker/issues/36) for some more useful links and resources for implementing translations.

<!-- Running Tests -->

<!-- ### :test_tube: Running Tests

To run tests, run the following command

```bash
  yarn test test
``` -->

<!-- Builds -->

### :triangular_flag_on_post: Builds

The build process has been automated to provide beta integration builds and production deployment builds, all accessible via the [projects releases page]().

#### App

[Fastlane](https://docs.fastlane.tools/actions/build_mac_app/) handles the builds with automatic `.app` and `.dmg` release targets (can be easily installed via Brew ~ `$ brew install fastlane`). This is further automated behind [GitHub Actions](.github/workflows/cicd.yml) to make the process even more fluid and provide automated CI/CD releases onto the [projects releases page](https://github.com/othyn/macos-auto-clicker/releases).

To locally test the fastlane build, run:

```sh
$ fastlane release
```

Which should generate the required `dist/Auto Clicker.app`, `dist/Auto Clicker.app.dSYM.zip` and `dist/Auto Clicker.dmg` build fragments.

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
