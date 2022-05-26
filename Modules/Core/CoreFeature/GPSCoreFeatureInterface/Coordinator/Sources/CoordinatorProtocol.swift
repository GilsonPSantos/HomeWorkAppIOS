import Foundation

public protocol CoordinatorProtocol: NSObject {
    var identifier: String { get }
    var rootViewController: UIViewController? { get set }
    var childCoordinators: [CoordinatorProtocol] { get set }
    func scene() -> UIViewController?

    func didFinishChild(_ child: CoordinatorProtocol)
    func popTo(_ identifier: String)
    func popToRoot()
}
