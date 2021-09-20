import Foundation
import GPSCoreFeatureInterface

protocol FeatureBuilderProtocol {
    func getFeature() -> ModuleProtocol
}

final class FeatureBuilder {
    lazy var tabBar = TabBarFeatureBuilder(featureItens: [home])
    lazy var home = HomeFeatureBuilder()
}
