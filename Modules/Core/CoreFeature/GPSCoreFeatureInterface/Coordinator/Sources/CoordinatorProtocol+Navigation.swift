import Foundation

public extension CoordinatorProtocol {
    func didFinishChild(_ child: CoordinatorProtocol)
    {
        childCoordinators.removeAll {
            $0 === child
        }
    }

    func popTo(_ identifier: String)
    {
        let indexCoordinatorToPop = childCoordinators.firstIndex { $0.identifier == identifier }
        guard let indexCoordinatorToPop = indexCoordinatorToPop,
              let viewControllerToPop = childCoordinators[indexCoordinatorToPop].rootViewController,
              let navigation = rootViewController?.navigationController,
              rootViewController != viewControllerToPop else {
            return
        }
        childCoordinators = childCoordinators.enumerated().filter {
            $0.offset <= indexCoordinatorToPop
        }.map {
            $0.element
        }

        navigation.popToViewController(viewControllerToPop, animated: true)
    }

    func popToRoot()
    {
        guard let navigation = rootViewController?.navigationController else {
            return
        }
        navigation.popToRootViewController(animated: true)
    }
}
