import UIKit

public protocol ProgressViewProtocol: UIView {
    var progressValue: CGFloat { get set }
}

public class ProgressCircleView: UIView, ProgressViewProtocol {
    private lazy var progressLayer = CAShapeLayer()
    private let ringWidth: CGFloat
    private let progressColor: UIColor
    public var progressValue: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    private let rotation = 90 * Double.pi / 180

    public init(ringWidth: CGFloat = 2.5,
                progressColor: UIColor = .white)
    {
        self.ringWidth = ringWidth
        self.progressColor = progressColor
        super.init(frame: .zero)
        setupLayers()
    }

    override init(frame: CGRect)
    {
        self.ringWidth = 2.5
        self.progressColor = .white
        super.init(frame: frame)
        setupLayers()
    }

    required init?(coder: NSCoder)
    {
        self.ringWidth = 2.5
        self.progressColor = .white
        super.init(coder: coder)
        setupLayers()
    }

    override public func draw(_ rect: CGRect)
    {
        setupDraw(rect)
    }

    private func setupLayers()
    {
        progressLayer.lineWidth = ringWidth
        progressLayer.fillColor = nil
        backgroundColor = .clear
        layer.addSublayer(progressLayer)
        layer.transform = CATransform3DMakeRotation(CGFloat(rotation), 0, 0, -1)
    }

    private func setupDraw(_ rect: CGRect)
    {
        let circlePath = UIBezierPath(ovalIn: rect.insetBy(dx: ringWidth / 2, dy: ringWidth / 2))
        progressLayer.path = circlePath.cgPath
        progressLayer.lineCap = .round
        progressLayer.strokeStart = 0
        progressLayer.strokeEnd = progressValue
        progressLayer.strokeColor = progressColor.cgColor
    }
}
