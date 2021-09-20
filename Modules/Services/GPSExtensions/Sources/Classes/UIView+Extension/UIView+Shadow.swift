import UIKit

public extension UIView {
    func addShadow(color: CGColor = UIColor.black.cgColor,
                   radius: CGFloat = 5,
                   opacity: Float = 0.2)
    {
        layer.shadowColor = color
        layer.shadowOpacity = opacity
        layer.shadowOffset = .zero
        layer.shadowRadius = radius
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}
