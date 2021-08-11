import Foundation

protocol TabBarPresenterProtocol {

}

protocol TabBarViewDelegate: NSObject {

}

extension TabBar {
    final class Presenter: TabBarPresenterProtocol {
        weak var viewController: TabBarViewDelegate?
    }
}
