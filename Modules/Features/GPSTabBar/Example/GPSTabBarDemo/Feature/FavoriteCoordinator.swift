import Foundation
import GPSCoreFeatureInterface

final class FavoriteCoordinator: NSObject, MainCoordinatorProtocol {

    var childCoordinators: [CoordinatorProtocol] = []

    var viewControllerType: UIViewController.Type = UIViewController.self

    var rootViewController: UIViewController?

    func start() {
        let navigation = UINavigationController()
        rootViewController =  navigation
        navigation.pushViewController(initialize(), animated: true)
    }

    func initialize() -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .blue
        return viewController
    }
}
