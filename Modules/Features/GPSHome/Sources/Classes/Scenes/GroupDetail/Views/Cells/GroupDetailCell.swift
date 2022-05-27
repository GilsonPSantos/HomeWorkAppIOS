import Cartography
import UIKit
import GPSUI

class GroupDetailCell: UITableViewCell {
    private let statusImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = Style.SystemImageName.check.image(color: Style.Color.success.color)
        return imageView
    }()

    private let textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = Style.margins.extraSmall
        stackView.axis = .vertical
        return stackView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = DesignSystemApp.shared.designSystem.labelTitle.textColor
        label.textAlignment = .left
        label.text = "Fazer comida"
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = DesignSystemApp.shared.designSystem.labelTitle.textColor
        label.textAlignment = .left
        label.text = "Gilson Santos"
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
        setupStatusImageView()
        setupTextStackView()
        setupArrowImage()
    }

    private func setupStatusImageView()
    {
        contentView.addSubview(statusImage)
        constrain(statusImage, contentView) { view, superView in
            view.leading == superView.leading + Style.margins.regular
            view.centerY == superView.centerY
            view.width == 26
            view.height == 26
        }
    }

    private func setupTextStackView()
    {
        contentView.addSubview(textStackView)
        constrain(textStackView, statusImage, contentView) { view, leftview, superView in
            view.leading == leftview.trailing + Style.margins.regular
            view.top == superView.top + Style.margins.regular
            view.bottom == superView.bottom - Style.margins.regular
        }
        setupTitleLabel()
        setupSubtitleLabel()
    }

    private func setupTitleLabel()
    {
        textStackView.addArrangedSubview(titleLabel)
    }

    private func setupSubtitleLabel()
    {
        textStackView.addArrangedSubview(subtitleLabel)
    }

    private func setupArrowImage()
    {
        contentView.addSubview(arrowImage)
        constrain(arrowImage, textStackView, contentView) { view, leftview, superview in
            view.leading == leftview.trailing + Style.margins.small
            view.trailing == superview.trailing - Style.margins.verySmall
            view.centerY == superview.centerY
            view.width == 20
            view.height == 20
        }
    }

    func setup(viewModel: GroupDetail.ViewModel)
    {
    }
}
