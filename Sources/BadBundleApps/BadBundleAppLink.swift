import SwiftUI

/// A list row that opens an app's page on badbundle.com: the app's icon, name and tagline, and an arrow to say the row
/// leaves the app.
///
/// Made for a `List` or `Form`, with the section around it left to the app, for example:
///
/// ```swift
/// Section("More Apps") {
///     ForEach(BadBundleApp.all(except: .gps)) { app in
///         BadBundleAppLink(app)
///     }
/// }
/// ```
public struct BadBundleAppLink: View {
    private let app: BadBundleApp
    @ScaledMetric(relativeTo: .body) private var iconSize: Double = 40

    public init(_ app: BadBundleApp) {
        self.app = app
    }

    public var body: some View {
        Link(destination: app.url) {
            HStack(spacing: 12) {
                BadBundleAppIcon(app)
                    .frame(width: iconSize, height: iconSize)
                    .accessibilityHidden(true)

                VStack(alignment: .leading, spacing: 2) {
                    Text(app.name)
                    Text(app.tagline)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Spacer(minLength: 0)

                Image(systemName: "arrow.up.forward")
                    .font(.footnote.weight(.semibold))
                    .foregroundStyle(.tertiary)
                    .accessibilityHidden(true)
            }
            // The label's colours rather than the tint a link takes in a list, so the row reads like the rows
            // around it.
            .foregroundStyle(Color.primary)
        }
    }
}

#Preview {
    List {
        Section("More Apps") {
            ForEach(BadBundleApp.all) { app in
                BadBundleAppLink(app)
            }
        }
    }
}
