import UIKit
import GPSCoreFeatureInterface

public struct Module: ModuleProtocol {
    private let dependencies: Dependencies

    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    public func createInitialScene(rootViewController: UIViewController?) {
        TabBar.Coordinator(dependencies: dependencies, rootViewController: rootViewController).start()
    }

    public func createCoordinator(rootViewController: UIViewController?) -> BaseCoordinatorProtocol {
        TabBar.Coordinator(dependencies: dependencies, rootViewController: rootViewController)
    }
}
