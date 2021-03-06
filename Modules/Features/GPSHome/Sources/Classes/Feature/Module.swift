import UIKit
import GPSCoreFeatureInterface

public struct Module: ModuleProtocol {
    private let dependencies: Dependencies

    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    public func createInitialScene(rootViewController: UIViewController?) {}

    public func createCoordinator(rootViewController: UIViewController?) -> BaseCoordinatorProtocol {
        Home.Coordinator(dependencies: dependencies)
    }
}
