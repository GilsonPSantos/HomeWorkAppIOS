import UIKit
import GPSCoreFeatureInterface

protocol HomeCoordinatorProtocol: MainCoordinatorProtocol {}

extension Home {
    final class Coordinator: NSObject, HomeCoordinatorProtocol {
        private let dependencies: Dependencies
        var childCoordinators: [CoordinatorProtocol] = []
        var viewControllerType: UIViewController.Type = Home.ViewController.self
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
            let viewController = initialize()
            rootViewController = viewController
        }

        func initialize() -> UIViewController {
            let coordinator = self
            let presenter = Presenter()
            let dataStore = DataStore()
            let dataProvider = DataProvider()
            let interactor = Interactor(dataStore: dataStore,
                                        presenter: presenter,
                                        dataProvider: dataProvider)
            let view = HomeView.make()
            let viewController = ViewController(interactor: interactor,
                                                customView: view,
                                                coordinator: coordinator)
            presenter.viewController = viewController

            return UINavigationController(rootViewController: viewController)
        }
    }
}
