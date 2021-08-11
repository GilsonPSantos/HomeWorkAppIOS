import Foundation

public protocol BaseCoordinatorProtocol: NSObject {
    var viewControllerType: UIViewController.Type { get }
    var rootViewController: UIViewController? { get set }
    func initialize() -> UIViewController
}
