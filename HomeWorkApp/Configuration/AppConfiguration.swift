import UIKit
import GPSCoreFeatureInterface

protocol AppConfigurationProtocol {
    func startInitialScene()
}

final class AppConfiguration: AppConfigurationProtocol {
    private let window: UIWindow?
    private let featureBuilder = FeatureBuilder()
    private lazy var mainCoordinator = featureBuilder.home.getFeature().createCoordinator(rootViewController: nil)

    init(window: UIWindow?)
    {
        self.window = window
    }

    func startInitialScene()
    {
        mainCoordinator.displayScene()
        window?.rootViewController = mainCoordinator.rootViewController
        window?.makeKeyAndVisible()
    }
}
