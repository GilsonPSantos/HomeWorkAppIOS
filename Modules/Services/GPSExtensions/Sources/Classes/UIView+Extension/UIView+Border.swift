import UIKit

public extension UIView {
    func addBoarder(widith: CGFloat = 0.7,
                    color: CGColor = UIColor.white.cgColor)
    {
        layer.borderColor = color
        layer.borderWidth = widith
    }
}
