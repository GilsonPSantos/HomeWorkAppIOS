import Cartography
import UIKit
import GPSUI

class HomeCell: UITableViewCell {
    private let containerView: UIView = {
        let view = UIView()
        view.addBoarder()
        view.addCornerRadius()
        view.addShadow()
        view.backgroundColor = DesignSystemApp.shared.designSystem.backgroundColor
        return view
    }()

    private let lineView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        view.backgroundColor = DesignSystemApp.shared.designSystem.labelTitle.textColor

        return view
    }()

    private let statusImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = Style.SystemImageName.check.image(color: .green)
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = DesignSystemApp.shared.designSystem.labelTitle.textColor
        label.textAlignment = .left
        label.text = "Grupo da familia"
        return label
    }()

    private let arrowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = Style.SystemImageName.arrow.image(color: DesignSystemApp.shared.designSystem.labelTitle.textColor)
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder)
    {
        fatalError()
    }

    private func setup()
    {
        backgroundColor = DesignSystemApp.shared.designSystem.backgroundColor
        selectionStyle = .none
        setupContainerView()
    }

    private func setupContainerView()
    {
        contentView.addSubview(containerView)
        constrain(containerView, contentView) { view, superView in
            view.leading == superView.leading + Style.margins.regular
            view.trailing == superView.trailing - Style.margins.regular
            view.top == superView.top + Style.margins.small
            view.bottom == superView.bottom - Style.margins.small
        }
        setupLineView()
        setupImageView()
        setupTitleLabel()
        setupArrowImage()
    }

    private func setupLineView()
    {
        containerView.addSubview(lineView)
        constrain(lineView, containerView) { view, superView in
            view.leading == superView.leading
            view.top == superView.top
            view.bottom == superView.bottom
            view.width == 10
        }
    }

    private func setupImageView()
    {
        containerView.addSubview(statusImage)
        constrain(statusImage, lineView, containerView) { view, leftview, superview in
            view.top >= superview.top + Style.margins.small
            view.leading == leftview.trailing + Style.margins.small
            view.centerY == superview.centerY
            view.bottom <= superview.bottom - Style.margins.small
            view.width == 48
            view.height == 40
        }
    }

    private func setupTitleLabel()
    {
        containerView.addSubview(titleLabel)
        constrain(titleLabel, statusImage, containerView) { view, leftview, superView in
            view.leading == leftview.trailing + Style.margins.regular
            view.top >= superView.top + Style.margins.small
            view.bottom <= superView.bottom - Style.margins.small
            view.centerY == superView.centerY
        }
    }

    private func setupArrowImage()
    {
        containerView.addSubview(arrowImage)
        constrain(arrowImage, titleLabel, containerView) { view, leftview, superview in
            view.leading == leftview.trailing + Style.margins.small
            view.trailing == superview.trailing - Style.margins.verySmall
            view.centerY == superview.centerY
            view.width == 20
            view.height == 20
        }
    }
}
