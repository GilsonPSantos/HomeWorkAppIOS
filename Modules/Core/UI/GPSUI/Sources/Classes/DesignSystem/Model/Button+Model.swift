import Foundation

public struct ButtonUI: Decodable {
    private enum CodingKeys: String, CodingKey {
        case backgroundColor, textColor, disabledColor
    }

    public let backgroundColor: UIColor
    public let textColor: UIColor
    public let disabledColor: UIColor

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.backgroundColor = try container.decode(String.self, forKey: .backgroundColor).hexStringToUIColor()
        self.textColor = try container.decode(String.self, forKey: .textColor).hexStringToUIColor()
        self.disabledColor = try container.decode(String.self, forKey: .disabledColor).hexStringToUIColor()
    }
}
