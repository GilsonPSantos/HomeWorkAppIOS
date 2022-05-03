import Foundation

public protocol IdentifierProtocol: Equatable {
    var metaType: CoordinatorProtocol.Type { get }
}
