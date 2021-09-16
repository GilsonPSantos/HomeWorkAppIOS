import UIKit
import Cartography

class HomeCell: UITableViewCell {
    private let containerView: UIView = {
        let view = UIView()
        view.addBoarder()
        view.addCornerRadius()
        view.addShadow()
        view.backgroundColor = .white
        return view
    }()

    private let lineView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        view.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)

        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
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
        backgroundColor = .white
        selectionStyle = .none
        setupContainerView()
    }

    private func setupContainerView() {
        contentView.addSubview(containerView)
        constrain(containerView, contentView) { view, superView in
            view.leading == superView.leading + 16
            view.trailing == superView.trailing - 16
            view.top == superView.top + 16
            view.bottom == superView.bottom - 16
            view.height == 100
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
