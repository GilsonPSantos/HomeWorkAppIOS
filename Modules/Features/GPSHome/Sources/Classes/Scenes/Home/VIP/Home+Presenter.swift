import UIKit
import GPSUI

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
                      percentageCompletedValue: 90.0,
                      percentagelabel: "90%",
                      percentageColor: color(with: 90.0)),
                .init(title: "Grupo da Familia",
                      percentageCompletedValue: 40.0,
                      percentagelabel: "40%",
                      percentageColor: color(with: 40.0)),
                .init(title: "Grupo da Familia",
                      percentageCompletedValue: 60.0,
                      percentagelabel: "60%",
                      percentageColor: color(with: 60.0))
            ]
        }

        private func color(with value: CGFloat) -> UIColor
        {
            if value >= 80.0 {
                return Style.Color.success.color
            } else if value <= 50.0 {
                return Style.Color.error.color
            } else {
                return Style.Color.warning.color
            }
        }
    }
}
