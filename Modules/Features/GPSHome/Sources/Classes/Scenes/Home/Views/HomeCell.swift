import Cartography
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

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = DesignSystemApp.shared.designSystem.labelTitle.textColor
        label.textAlignment = .left
        label.text = "Grupo da familia"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private func setup() {
        backgroundColor = DesignSystemApp.shared.designSystem.backgroundColor
        selectionStyle = .none
        setupContainerView()
    }

    private func setupContainerView() {
        contentView.addSubview(containerView)
        constrain(containerView, contentView) { view, superView in
            view.leading == superView.leading + 16
            view.trailing == superView.trailing - 16
            view.top == superView.top + 10
            view.bottom == superView.bottom - 10
            view.height == 70
        }
        setupLineView()
        setupTitleLabel()
    }

    private func setupLineView() {
        containerView.addSubview(lineView)
        constrain(lineView, containerView) { view, superView in
            view.leading == superView.leading
            view.top == superView.top
            view.bottom == superView.bottom
            view.width == 10
        }
    }

    private func setupTitleLabel() {
        containerView.addSubview(titleLabel)
        constrain(titleLabel, lineView, containerView) { view, left, superView in
            view.leading == left.trailing + 16
            view.trailing == superView.trailing
            view.top >= superView.top
            view.centerY == superView.centerY
        }
    }
}
