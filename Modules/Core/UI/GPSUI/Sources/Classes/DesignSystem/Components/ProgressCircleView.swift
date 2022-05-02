import UIKit

public class ProgressCircleView: UIView, ProgressViewProtocol {
    private lazy var progressLayerMainValue = CAShapeLayer()
    private lazy var progressLayerSecondaryValue = CAShapeLayer()
    private let ringWidth: CGFloat
    public var progressColor: UIColor = .red {
        didSet {
            setNeedsDisplay()
        }
    }
    public var progressValue: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    private let rotation = -(90 * Double.pi / 180)

    public init(ringWidth: CGFloat = 3.5)
    {
        self.ringWidth = ringWidth
        super.init(frame: .zero)
        setupLayers()
    }

    override init(frame: CGRect)
    {
        self.ringWidth = 2.5
        super.init(frame: frame)
        setupLayers()
    }

    required init?(coder: NSCoder)
    {
        self.ringWidth = 2.5
        super.init(coder: coder)
        setupLayers()
    }

    override public func draw(_ rect: CGRect)
    {
        setupDraw(rect)
    }

    private func setupLayers()
    {
        backgroundColor = .clear
        layer.transform = CATransform3DMakeRotation(CGFloat(rotation), 0, 0, -1)
        configureLayer(progressLayerMainValue)
        configureLayer(progressLayerSecondaryValue)
    }

    private func configureLayer(_ layer: CAShapeLayer)
    {
        layer.lineWidth = ringWidth
        layer.fillColor = nil
        self.layer.addSublayer(layer)
    }

    private func setupDraw(_ rect: CGRect)
    {
        let circlePath = UIBezierPath(ovalIn: rect.insetBy(dx: ringWidth / 2, dy: ringWidth / 2))
        progressLayerMainValue.path = circlePath.cgPath
        progressLayerSecondaryValue.path = circlePath.cgPath
        progressLayerMainValue.lineCap = .round
        progressLayerSecondaryValue.lineCap = .round
        setupLayerPrimaryLayer()
        setupLayerSecondaryLayer()
    }

    private func setupLayerPrimaryLayer()
    {
        progressLayerMainValue.strokeStart = 0
        progressLayerMainValue.strokeEnd = progressValue / 100
        progressLayerMainValue.strokeColor = progressColor.cgColor
    }

    private func setupLayerSecondaryLayer()
    {
        progressLayerSecondaryValue.strokeStart = progressValue / 100
        progressLayerSecondaryValue.strokeEnd = 1
        progressLayerSecondaryValue.strokeColor = DesignSystemApp.shared.designSystem.labelTitle.textColor.cgColor
    }
}
