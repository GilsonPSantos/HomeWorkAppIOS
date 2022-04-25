import Foundation
import GPSCoreFeatureInterface
import GPSHome

final class HomeFeatureBuilder: FeatureBuilderProtocol {
    func getFeature() -> ModuleProtocol {
        Module.init(dependencies: getDependencies())
    }

    private func getDependencies() -> Dependencies {
        .init()
    }
}
