import Foundation

public protocol ModuleProtocol {
    func createInitialScene(rootViewController: UIViewController?)
    func createCoordinatorTabBar(rootViewController: UIViewController?) -> MainCoordinatorProtocol?
    func createCoordinator(rootViewController: UIViewController?) -> BaseCoordinatorProtocol
}

public extension ModuleProtocol {
    func createCoordinatorTabBar(rootViewController: UIViewController?) -> MainCoordinatorProtocol? {
        nil
    }
}
