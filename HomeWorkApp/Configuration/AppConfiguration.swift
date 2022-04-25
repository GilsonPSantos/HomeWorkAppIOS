import UIKit
import GPSCoreFeatureInterface

protocol AppConfigurationProtocol {
    func startInitialScene()
}

final class AppConfiguration: AppConfigurationProtocol {
    private let window: UIWindow?
    private let featureBuilder = FeatureBuilder()
    private lazy var mainCoordinator = featureBuilder.tabBar.getFeature().createCoordinator(rootViewController: nil)

    init(window: UIWindow?) {
        self.window = window
    }

    func startInitialScene() {
        mainCoordinator.start()
        window?.rootViewController = mainCoordinator.rootViewController
        window?.makeKeyAndVisible()
    }
}
