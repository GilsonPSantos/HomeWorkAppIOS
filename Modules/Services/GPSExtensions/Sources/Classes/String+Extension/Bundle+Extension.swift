import Foundation

public extension Bundle {
    static func resourceBundle(for frameworkClass: AnyClass) -> Bundle {
        let frameworkBundle = Bundle(for: frameworkClass)

        guard
            let moduleName = String(reflecting: frameworkClass).components(separatedBy: ".").first,
            let resourceBundleURL = frameworkBundle.url(forResource: moduleName, withExtension: "bundle"),
            let resourceBundle = Bundle(url: resourceBundleURL)
            else
        {
            return frameworkBundle
        }

        return resourceBundle
    }
}
