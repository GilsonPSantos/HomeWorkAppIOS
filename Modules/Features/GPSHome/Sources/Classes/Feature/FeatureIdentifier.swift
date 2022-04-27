import Foundation
import GPSCoreFeatureInterface

enum FeatureIdentifier: String, IdentifierProtocol {
    case home

    var metaType: CoordinatorProtocol.Type {
        switch self {
        case .home:
            return Home.Coordinator.self
        }
    }
}
