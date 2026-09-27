import Foundation
import Testing
@testable import BadBundleApps

#if canImport(UIKit)
import UIKit
#else
import AppKit
#endif

struct BadBundleAppTests {
    @Test
    func all_namesEachAppOnce() {
        let ids = BadBundleApp.all.map(\.id)
        #expect(Set(ids).count == ids.count)
    }

    @Test
    func allExcept_leavesOutOnlyThatApp() {
        #expect(BadBundleApp.all(except: .gps) == [.trackSlash, .vault, .splitThing])
    }

    @Test
    func url_isTheAppsPageOnBadBundleDotCom() {
        #expect(BadBundleApp.vault.url.absoluteString == "https://badbundle.com/apps/vault/")
        #expect(BadBundleApp.splitThing.url.absoluteString == "https://badbundle.com/apps/split-thing/")
    }

    @Test(arguments: BadBundleApp.all)
    func icon_isInTheAssetCatalog(app: BadBundleApp) {
        #if canImport(UIKit)
        let image = UIImage(named: app.id, in: .module, with: nil)
        #else
        let image = Bundle.module.image(forResource: app.id)
        #endif
        #expect(image != nil)
    }
}
