import Foundation
import GPSCoreFeatureInterface

protocol FeatureBuilderProtocol {
    func getFeature() -> ModuleProtocol
}

final class FeatureBuilder {
    lazy var home = HomeFeatureBuilder()
}
