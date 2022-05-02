import Foundation

public struct NavigationUI: Decodable {
    private enum CodingKeys: String, CodingKey {
        case backgroundColor, tintColor
    }

    public let backgroundColor: UIColor
    public let tintColor: UIColor

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.backgroundColor = try container.decode(String.self, forKey: .backgroundColor).hexStringToUIColor()
        self.tintColor = try container.decode(String.self, forKey: .tintColor).hexStringToUIColor()
    }
}
