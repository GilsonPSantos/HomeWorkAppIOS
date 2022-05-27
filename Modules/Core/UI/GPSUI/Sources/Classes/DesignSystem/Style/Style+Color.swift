import Foundation
import GPSExtensions

extension Style {
    public enum Color: String {
        case success = "9FC131"
        case error = "D92525"
        case warning = "FFB30D"

        public var color: UIColor {
            rawValue.hexStringToUIColor()
        }
    }
}
