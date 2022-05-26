import UIKit
import GPSCoreFeatureInterface
import GPSUI

protocol GroupDetailCoordinatorProtocol: CoordinatorProtocol {}

extension GroupDetail {
    final class Coordinator: NSObject, GroupDetailCoordinatorProtocol {
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

        private func initialize() -> UIViewController
        {
            let coordinator = self
            let presenter = Presenter()
            let dataStore = DataStore()
            let dataProvider = DataProvider()
            let interactor = Interactor(dataStore: dataStore,
                                        presenter: presenter,
                                        dataProvider: dataProvider)
            let view = GroupDetailView.make()
            let viewController = ViewController(interactor: interactor,
                                                customView: view,
                                                coordinator: coordinator)
            view.setup(delegate: viewController)
            presenter.viewController = viewController
            self.rootViewController = viewController

            return NavigationController(rootViewController: viewController)
        }
    }
}
