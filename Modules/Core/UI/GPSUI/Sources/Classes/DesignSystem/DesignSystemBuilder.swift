import Foundation
import GPSExtensions

public protocol DesignSystemBuilderProtocol {
    func getJsonFile() -> DesignSystem
}

final class DesignSystemBuilder: DesignSystemBuilderProtocol {
    func getJsonFile() -> DesignSystem {
        guard let url = Bundle.resourceBundle(for: Self.self).url(forResource: "DesignSystem", withExtension: "json") else {
            fatalError()
        }
        do {
            let jsonData = try Data(contentsOf: url)
            return try JSONDecoder().decode(DesignSystem.self, from: jsonData)
        } catch {
            fatalError()
        }
    }
}
