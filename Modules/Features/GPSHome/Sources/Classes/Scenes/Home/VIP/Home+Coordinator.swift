import UIKit
import GPSCoreFeatureInterface
import GPSUI

protocol HomeCoordinatorProtocol: CoordinatorProtocol {}

extension Home {
    final class Coordinator: NSObject, HomeCoordinatorProtocol {
        var identifier: String = FeatureIdentifier.home.rawValue
        private let dependencies: Dependencies
        var childCoordinators: [CoordinatorProtocol] = []
        weak var rootViewController: UIViewController?

        init(dependencies: Dependencies)
        {
            self.dependencies = dependencies
        }

        func scene() -> UIViewController?
        {
            initialize()
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
            self.rootViewController = viewController

            return viewController
        }
    }
}
