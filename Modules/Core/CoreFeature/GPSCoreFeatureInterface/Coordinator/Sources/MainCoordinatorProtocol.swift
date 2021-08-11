//
//  MainCoordinatorProtocol.swift
//  GPSCoordinatorInterface
//
//  Created by Gilson Santos on 11/08/21.
//

import Foundation

public protocol MainCoordinatorProtocol: BaseCoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] { get set }
    func didFinishChild(_ child: CoordinatorProtocol)
    func popTo(_ type: UIViewController.Type)
    func popToRoot()
}

extension MainCoordinatorProtocol {
    func didFinishChild(_ child: CoordinatorProtocol) {
        childCoordinators.removeAll {
            $0 === child
        }
    }

    func popTo(_ type: UIViewController.Type) {
        guard let indexChild = childCoordinators.firstIndex (where: { $0.viewControllerType == type }),
              let navigation = rootViewController?.navigationController,
              let viewController = navigation.viewControllers.first(where: { $0 === type}) else {
            return
        }
        childCoordinators = childCoordinators.enumerated().filter {
            $0.offset <= indexChild
        }.map {
            $0.element
        }
        navigation.popToViewController(viewController, animated: true)
    }

    func popToRoot() {
        guard let navigation = rootViewController?.navigationController else {
            return
        }
        navigation.popToRootViewController(animated: true)
    }
}
