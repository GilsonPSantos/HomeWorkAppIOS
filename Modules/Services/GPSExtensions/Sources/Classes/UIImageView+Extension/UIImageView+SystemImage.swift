import UIKit

public extension UIImageView {
    func systemImage(with name: String, for color: UIColor)
    {
        image = UIImage(systemName: name)?
            .withRenderingMode(.alwaysOriginal)
            .withTintColor(color)
    }
}
