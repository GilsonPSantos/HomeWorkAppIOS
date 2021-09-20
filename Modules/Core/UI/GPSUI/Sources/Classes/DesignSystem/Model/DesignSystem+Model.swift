import Foundation

public struct DesignSystem: Decodable {
    let navigation: Navigation
    let primaryButton: Button
    let secondaryButton: Button
}

public struct Navigation: Decodable {
    private enum CodingKeys: String, CodingKey {
        case backgroundColor, tintColor
    }

    let backgroundColor: UIColor
    let tintColor: UIColor

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.backgroundColor = try container.decode(String.self, forKey: .backgroundColor).hexStringToUIColor()
        self.tintColor = try container.decode(String.self, forKey: .tintColor).hexStringToUIColor()
    }
}

public struct Button: Decodable {
    private enum CodingKeys: String, CodingKey {
        case backgroundColor, textColor, disabledColor
    }

    let backgroundColor: UIColor
    let textColor: UIColor
    let disabledColor: UIColor

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.backgroundColor = try container.decode(String.self, forKey: .backgroundColor).hexStringToUIColor()
        self.textColor = try container.decode(String.self, forKey: .textColor).hexStringToUIColor()
        self.disabledColor = try container.decode(String.self, forKey: .disabledColor).hexStringToUIColor()
    }
}
