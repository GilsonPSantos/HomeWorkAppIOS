import Foundation
import GPSCoreFeatureInterface

protocol TabBarCoordinatorProtocol: MainCoordinatorProtocol {

}

extension TabBar {
    final class Coordinator: NSObject, TabBarCoordinatorProtocol {
        var viewControllerType: UIViewController.Type = ViewController.self
        private let dependencies: Dependencies
        var childCoordinators: [CoordinatorProtocol]
        weak var rootViewController: UIViewController?

        init(childCoordinators: [CoordinatorProtocol] = [],
             dependencies: Dependencies,
             rootViewController: UIViewController? = nil)
        {
            self.childCoordinators = childCoordinators
            self.dependencies = dependencies
            self.rootViewController = rootViewController
        }

        func start() {
            rootViewController = initialize()
        }

        func initialize() -> UIViewController {
            let coordinator = self
            let presenter = Presenter()
            let dataStore = DataStore(itensTabBar: dependencies.itensTabBar)
            let interactor = Interactor(dataStore: dataStore,
                                        presenter: presenter,
                                        coordinator: coordinator)
            let viewController = ViewController(interactor: interactor)
            viewController.modalPresentationStyle = .fullScreen
            viewController.viewControllers = dataStore.itensTabBar.compactMap {
                $0.start()
                return $0.rootViewController
            }
            presenter.viewController = viewController
            return viewController
        }
    }
}
