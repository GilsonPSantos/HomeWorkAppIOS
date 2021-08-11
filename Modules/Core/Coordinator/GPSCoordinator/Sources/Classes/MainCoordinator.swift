import Foundation
import GPSCoordinatorInterface

final class MainCoordinator {
    weak var rootViewController: UIViewController?

    func initialize() -> UIViewController {
        return UIViewController()
    }

    func setup(_ rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
}

