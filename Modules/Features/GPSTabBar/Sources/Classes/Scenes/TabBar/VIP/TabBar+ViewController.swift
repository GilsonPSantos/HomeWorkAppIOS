import Foundation

extension TabBar {
    final class ViewController: UITabBarController {
        private let interactor: Interactor

        init(interactor: Interactor) {
            self.interactor = interactor
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}

extension TabBar.ViewController: TabBarViewDelegate {

}
