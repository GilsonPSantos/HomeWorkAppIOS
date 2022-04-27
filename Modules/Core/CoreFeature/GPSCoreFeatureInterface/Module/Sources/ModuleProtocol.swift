import Foundation

public protocol ModuleProtocol {
    func createInitialScene(rootViewController: UIViewController?)
    func createCoordinator(rootViewController: UIViewController?) -> CoordinatorProtocol
}
