import Foundation

/// An app made by Bad Bundle, as badbundle.com lists it.
public struct BadBundleApp: Identifiable, Hashable, Sendable {
    /// The app's slug on badbundle.com: `vault` in `https://badbundle.com/apps/vault/`. It also names the app's icon
    /// in this package's asset catalog.
    public let id: String
    public let name: String
    /// The app's tagline on badbundle.com, word for word, so the apps and the site describe it the same way.
    public let tagline: String

    /// The app's page on badbundle.com, which links on to wherever the app itself is: the App Store or the web.
    public var url: URL {
        URL(string: "https://badbundle.com/apps/\(id)/")!
    }
}

extension BadBundleApp {
    public static let trackSlash = BadBundleApp(
        id: "track-slash",
        name: "Track Slash",
        tagline: "An open-source issue tracker for teams that need speed, clarity, and control."
    )

    public static let vault = BadBundleApp(
        id: "vault",
        name: "Vault",
        tagline: "2FA and secret vault with offline encrypted backups."
    )

    public static let gps = BadBundleApp(
        id: "gps",
        name: "GPS",
        tagline: "Live speed, altitude and position, straight from your phone's GPS."
    )

    public static let splitThing = BadBundleApp(
        id: "split-thing",
        name: "Split Thing",
        tagline: "Shared costs, split fairly, settled simply."
    )

    /// Every app, in the order badbundle.com lists them.
    public static let all: [BadBundleApp] = [.trackSlash, .vault, .gps, .splitThing]

    /// Every app but `app`, for an app to list the others without itself.
    public static func all(except app: BadBundleApp) -> [BadBundleApp] {
        all.filter { $0 != app }
    }
}
