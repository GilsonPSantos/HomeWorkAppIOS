import Foundation

public protocol CoordinatorProtocol {
    var rootViewController: UIViewController? { get set }
    func initialize() -> UIViewController
    func setup(_ rootViewController: UIViewController)
}
