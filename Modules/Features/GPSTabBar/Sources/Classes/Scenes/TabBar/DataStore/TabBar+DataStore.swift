import Foundation
import GPSCoreFeatureInterface

protocol TabBarDataStoreProtocol {
    var itensTabBar: [MainCoordinatorProtocol] { get }
    var selectedIntex: Int { get set }
}

extension TabBar {
    final class DataStore: TabBarDataStoreProtocol {
        var itensTabBar: [MainCoordinatorProtocol]
        var selectedIntex: Int = 0

        init(itensTabBar: [MainCoordinatorProtocol] = []) {
            self.itensTabBar = itensTabBar
        }
    }
}
