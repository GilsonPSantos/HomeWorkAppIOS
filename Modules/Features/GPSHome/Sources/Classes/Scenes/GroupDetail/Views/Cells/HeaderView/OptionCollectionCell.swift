import UIKit
import Cartography
import GPSUI

class OptionCollectionCell: UICollectionViewCell {
    private let containerView: UIView = {
        let view = UIView()
//        view.addCornerRadius(radius: 70)
        view.backgroundColor = .red
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = DesignSystemApp.shared.designSystem.labelTitle.textColor
        label.textAlignment = .left
        label.text = "Fazer comida"
        return label
    }()

    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder)
    {
        fatalError()
    }

    private func setup()
    {
        backgroundColor = DesignSystemApp.shared.designSystem.backgroundColor
        setupContainerView()
    }

    private func setupContainerView()
    {
        contentView.addSubview(containerView)
        constrain(containerView, contentView) { view, superview in
            view.edges == superview.edges
        }
        setupTitleLabel()
    }

    private func setupTitleLabel()
    {
        containerView.addSubview(titleLabel)
        constrain(titleLabel, containerView) { view, superview in
            view.edges == superview.edges.inseted(by: Style.margins.small)
        }
    }
}
