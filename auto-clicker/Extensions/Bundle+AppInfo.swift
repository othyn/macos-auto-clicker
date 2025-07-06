//
//  Bundle+AppInfo.swift
//  auto-clicker
//
//  Created by Ben Tindall on 14/07/2023.
//

import Foundation

extension Bundle {
    public var appName: String { getInfo("CFBundleName")  }
    public var displayName: String { getInfo("CFBundleDisplayName") }
    public var identifier: String { getInfo("CFBundleIdentifier") }
    public var copyright: String { getInfo("NSHumanReadableCopyright") }

    public var appBuild: String { getInfo("CFBundleVersion") }
    public var appVersionLong: String { getInfo("CFBundleShortVersionString") }
    public var appVersionShort: String { getInfo("CFBundleShortVersion") }

    public var language: String { getInfo("CFBundleDevelopmentRegion") }

    fileprivate func getInfo(_ str: String) -> String { infoDictionary?[str] as? String ?? "N/A" }
}
