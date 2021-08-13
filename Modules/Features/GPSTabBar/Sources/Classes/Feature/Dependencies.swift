import GPSCoreFeatureInterface

public struct Dependencies {
    let itensTabBar: [MainCoordinatorProtocol]

    public init(itensTabBar: [MainCoordinatorProtocol]) {
        self.itensTabBar = itensTabBar
    }
}
