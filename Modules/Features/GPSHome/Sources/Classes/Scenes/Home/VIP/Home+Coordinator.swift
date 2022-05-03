import UIKit
import GPSCoreFeatureInterface
import GPSUI

protocol HomeCoordinatorProtocol: CoordinatorProtocol {}

extension Home {
    final class Coordinator: NSObject, HomeCoordinatorProtocol {
        var identifier: String = FeatureIdentifier.home.rawValue
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

        func displayScene()
        {
            let viewController = initialize()
            rootViewController = viewController
        }

        func initialize() -> UIViewController
        {
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
            view.setup(delegate: viewController)
            presenter.viewController = viewController

            return NavigationController(rootViewController: viewController)
        }
    }
}
