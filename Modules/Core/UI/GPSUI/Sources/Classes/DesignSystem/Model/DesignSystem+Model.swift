import Foundation

public struct DesignSystem: Decodable {
    let navigation: Navigation
    let primaryButton: Button
    let secondaryButton: Button
}

public struct Navigation: Decodable {
    let backgroundColor: String
    let tintColor: String
}

public struct Button: Decodable {
    let backgroundColor: String
    let textColor: String
    let disabledColor: String
}
