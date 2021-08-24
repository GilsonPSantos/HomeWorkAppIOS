import Cartography
import UIKit

protocol HomeViewProtocol where Self: UIView {
    func setup(delegate: HomeViewDelegate)
}

protocol HomeViewDelegate: NSObject { }

final class HomeView: UIView, HomeViewProtocol {
    static func make() -> HomeViewProtocol {
        return HomeView()
    }

    override init(frame: CGRect = .zero)
    {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    private func setup() {
        backgroundColor = UIColor.blue
    }

    func setup(delegate: HomeViewDelegate) {}
}
