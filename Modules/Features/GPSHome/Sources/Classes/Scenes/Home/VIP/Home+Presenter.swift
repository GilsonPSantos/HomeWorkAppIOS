import UIKit

protocol HomePresenterProtocol {
    func present()
}

protocol HomePresenterDelegate: AnyObject {
    func render(_ viewModel: [Home.ViewModel])
}

extension Home {
    final class Presenter: HomePresenterProtocol {
        weak var viewController: HomePresenterDelegate?

        func present()
        {
            viewController?.render(viewModel())
        }

        private func viewModel() -> [Home.ViewModel]
        {
            [
                .init(title: "Grupo da Familia",
                      percentageCompletedValue: 80.0,
                      percentagelabel: "80%")
            ]
        }
    }
}
