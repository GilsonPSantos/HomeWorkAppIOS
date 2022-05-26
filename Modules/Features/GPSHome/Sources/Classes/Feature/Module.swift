import UIKit
import GPSCoreFeatureInterface

public struct Module: ModuleProtocol {
    private let dependencies: Dependencies

    public init(dependencies: Dependencies)
    {
        self.dependencies = dependencies
    }

    public func createInitialScene(rootViewController: UIViewController?)
    {
        let coordinator = createCoordinator(rootViewController: nil)

        guard let initialController = coordinator.scene() else {
            return
        }
        if let navigation = rootViewController?.navigationController {
            navigation.pushViewController(initialController, animated: true)
        } else if let navigation = rootViewController as? UINavigationController {
            navigation.pushViewController(initialController, animated: true)
        }
    }

    public func createCoordinator(rootViewController: UIViewController?) -> CoordinatorProtocol
    {
        Home.Coordinator(dependencies: dependencies)
    }
}
