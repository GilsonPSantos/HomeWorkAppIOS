import Foundation
import GPSCoreFeatureInterface
import GPSTabBar

final class TabBarFeatureBuilder: FeatureBuilderProtocol {
    private let featureItens: [FeatureBuilderProtocol]

    init(featureItens: [FeatureBuilderProtocol]) {
        self.featureItens = featureItens
    }

    func getFeature() -> ModuleProtocol {
        return Module.init(dependencies: getDependencies())
    }

    private func getDependencies() -> GPSTabBar.Dependencies {
        let features = featureItens.compactMap {
            $0.getFeature().createCoordinator(rootViewController: nil) as? MainCoordinatorProtocol
        }
        return .init(itensTabBar: features)
    }
}
