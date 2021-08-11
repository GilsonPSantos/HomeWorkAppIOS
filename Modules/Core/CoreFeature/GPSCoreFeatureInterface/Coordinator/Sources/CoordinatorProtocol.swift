import Foundation

public protocol CoordinatorProtocol: BaseCoordinatorProtocol {
    var parentCoordinator: MainCoordinatorProtocol { get }
}
