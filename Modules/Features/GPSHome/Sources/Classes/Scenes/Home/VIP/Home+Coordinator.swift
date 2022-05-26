import UIKit
import GPSCoreFeatureInterface
import GPSUI

protocol HomeCoordinatorProtocol: CoordinatorProtocol {
    func showDetail()
}

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

        func showDetail()
        {
            let coordinator = GroupDetail.Coordinator(dependencies: dependencies)
            let controller = coordinator.scene()
            rootViewController?.navigationController?.pushViewController(controller, animated: true)
        }

        func scene() -> UIViewController
        {
            initialize()
        }

        func initialize() -> UIViewController
        {
            let coordinator = self
            let presenter = Presenter()
            let dataStore = DataStore()
            let dataProvider = DataProvider()
            let interactor = Interactor(coordinator: coordinator,
                                        dataStore: dataStore,
                                        presenter: presenter,
                                        dataProvider: dataProvider)
            let view = HomeView.make()
            let viewController = ViewController(interactor: interactor,
                                                customView: view)
            view.setup(delegate: viewController)
            presenter.viewController = viewController
            self.rootViewController = viewController

            return viewController
        }
    }
}
