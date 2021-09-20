import Foundation

public struct LabelUI: Decodable {
    private enum CodingKeys: String, CodingKey {
        case textColor
    }

    public let textColor: UIColor

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.textColor = try container.decode(String.self, forKey: .textColor).hexStringToUIColor()
    }
}
