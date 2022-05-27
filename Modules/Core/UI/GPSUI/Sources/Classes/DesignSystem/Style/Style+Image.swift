import UIKit

extension Style {
    public enum SystemImageName: String {
        case check = "checkmark.circle.fill"
        case arrow = "chevron.right"
        case checkMark = "checkmark.circle"

        public func image(color: UIColor) -> UIImage?
        {
            let image = UIImage(systemName: self.rawValue)
            return image?.withRenderingMode(.alwaysOriginal).withTintColor(color)
        }
    }
}
