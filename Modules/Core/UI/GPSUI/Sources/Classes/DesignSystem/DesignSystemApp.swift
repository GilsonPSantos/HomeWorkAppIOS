import Foundation

public final class DesignSystemApp {
    public static let shared = DesignSystemApp()
    public let designSystem: DesignSystem
    private let designBuilder: DesignSystemBuilderProtocol

    private init(designBuilder: DesignSystemBuilderProtocol = DesignSystemBuilder()) {
        self.designBuilder = designBuilder
        self.designSystem = designBuilder.getJsonFile()
    }
}
