import UIKit

protocol HomePresenterProtocol {
    func present()
}

protocol HomePresenterDelegate: AnyObject {
    func render()
}

extension Home {
    final class Presenter: HomePresenterProtocol {
        weak var viewController: HomePresenterDelegate?

        func present()
        {
            viewController?.render()
        }
    }
}
