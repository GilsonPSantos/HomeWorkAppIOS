import UIKit

public extension UIView {
    func addBoarder(widith: CGFloat = 0.7,
                    color: CGColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
    {
        layer.borderColor = color
        layer.borderWidth = widith
    }
}
