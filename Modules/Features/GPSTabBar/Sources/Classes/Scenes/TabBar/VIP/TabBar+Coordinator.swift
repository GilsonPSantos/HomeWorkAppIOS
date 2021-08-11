import Foundation
import GPSCoreFeatureInterface

protocol TabBarCoordinatorProtocol: MainCoordinatorProtocol {

}

extension TabBar {
    final class Coordinator: NSObject, TabBarCoordinatorProtocol {
        var viewControllerType: UIViewController.Type = ViewController.self
        var childCoordinators: [CoordinatorProtocol] = []
        weak var rootViewController: UIViewController?

        func initialize() -> UIViewController {
            let coordinator = self
            let presenter = Presenter()
            let interactor = Interactor(presenter: presenter, coordinator: coordinator)
            let viewController = ViewController(interactor: interactor)
            return viewController
        }
    }
}
