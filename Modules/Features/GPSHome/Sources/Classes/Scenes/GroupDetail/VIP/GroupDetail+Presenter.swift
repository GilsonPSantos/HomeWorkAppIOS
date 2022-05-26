import UIKit
import GPSUI

protocol GroupDetailPresenterProtocol {
    func present()
}

protocol GroupDetailPresenterDelegate: AnyObject {
    func render(_ viewModel: [GroupDetail.ViewModel])
}

extension GroupDetail {
    final class Presenter: GroupDetailPresenterProtocol {
        weak var viewController: GroupDetailPresenterDelegate?

        func present()
        {
            viewController?.render(viewModel())
        }

        private func viewModel() -> [GroupDetail.ViewModel]
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
                return Style.Color.success.rawValue.hexStringToUIColor()
            } else if value <= 50.0 {
                return Style.Color.error.rawValue.hexStringToUIColor()
            } else {
                return Style.Color.warning.rawValue.hexStringToUIColor()
            }
        }
    }
}
