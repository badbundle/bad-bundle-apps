import SwiftUI

/// An app's icon, cut to the rounded square the Home Screen draws it in. It fills whatever frame it's given.
///
/// The images in the asset catalog are full-bleed squares, and the corners are drawn here, so every icon gets the
/// same shape whatever its source had.
public struct BadBundleAppIcon: View {
    private let app: BadBundleApp
    @Environment(\.displayScale) private var displayScale

    public init(_ app: BadBundleApp) {
        self.app = app
    }

    public var body: some View {
        Image(app.id, bundle: .module)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .clipShape(AppIconShape())
            // A hairline, so a light icon like Vault's keeps its edge on a white background.
            .overlay {
                AppIconShape()
                    .strokeBorder(Color.primary.opacity(0.1), lineWidth: 1 / displayScale)
            }
            .accessibilityLabel(Text(app.name))
    }
}

/// The Home Screen's icon shape at any size: a continuous rounded square whose corner radius is a fixed fraction of
/// its side.
struct AppIconShape: InsettableShape {
    var inset: CGFloat = 0

    func path(in rect: CGRect) -> Path {
        let rect = rect.insetBy(dx: inset, dy: inset)
        return RoundedRectangle(cornerRadius: min(rect.width, rect.height) * 0.2237, style: .continuous)
            .path(in: rect)
    }

    func inset(by amount: CGFloat) -> AppIconShape {
        AppIconShape(inset: inset + amount)
    }
}

#Preview {
    HStack {
        ForEach(BadBundleApp.all) { app in
            BadBundleAppIcon(app)
                .frame(width: 60, height: 60)
        }
    }
    .padding()
}
