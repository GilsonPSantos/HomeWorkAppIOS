import Foundation

public final class DesignSystemApp {
    public static let shared = DesignSystemApp()
    public let designSystem: DesignSystem
    private let designBuilder = DesignSystemBuilder()

    private init() {
        self.designSystem = designBuilder.getJsonFile()
    }
}
