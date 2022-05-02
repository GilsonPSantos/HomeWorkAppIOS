import Foundation

public struct DesignSystem: Decodable {
    private enum CodingKeys: String, CodingKey {
        case labelTitle, backgroundColor, navigation, primaryButton, secondaryButton
    }

    public let labelTitle: LabelUI
    public let backgroundColor: UIColor
    public let navigation: NavigationUI
    public let primaryButton: ButtonUI
    public let secondaryButton: ButtonUI

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.labelTitle = try container.decode(LabelUI.self, forKey: .labelTitle)
        self.backgroundColor = try container.decode(String.self, forKey: .backgroundColor).hexStringToUIColor()
        self.navigation = try container.decode(NavigationUI.self, forKey: .navigation)
        self.primaryButton = try container.decode(ButtonUI.self, forKey: .primaryButton)
        self.secondaryButton = try container.decode(ButtonUI.self, forKey: .secondaryButton)
    }
}
