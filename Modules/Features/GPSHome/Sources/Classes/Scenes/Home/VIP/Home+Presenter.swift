import UIKit

protocol HomePresenterProtocol {}

protocol HomePresenterDelegate: AnyObject {}

extension Home {
    final class Presenter: HomePresenterProtocol {
        weak var viewController: HomePresenterDelegate?
    }
}
