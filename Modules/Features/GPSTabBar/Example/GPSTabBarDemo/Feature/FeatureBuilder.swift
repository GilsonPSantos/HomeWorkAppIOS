import Foundation
import GPSTabBar

final class FeatureBuilder {

    func startModule() -> Module {
        .init(dependencies: getDependencies())
    }

    private func getDependencies() -> Dependencies {
        .init(itensTabBar: [HomeCoordinator(), FavoriteCoordinator()])
    }
    
}
