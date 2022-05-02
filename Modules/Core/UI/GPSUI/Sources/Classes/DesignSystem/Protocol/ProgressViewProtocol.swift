import Foundation

public protocol ProgressViewProtocol where Self: UIView {
    var progressValue: CGFloat { get set }
    var progressColor: UIColor { get set }
}
