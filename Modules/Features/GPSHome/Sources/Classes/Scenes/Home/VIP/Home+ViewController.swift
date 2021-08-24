import UIKit

extension Home {
    final class ViewController: UIViewController {
        private let interactor: HomeInteractorProtocol
        private let customView: HomeViewProtocol
        private let coordinator: MySceneCoordinatorProtocol

        init(interactor: HomeInteractorProtocol,
             customView: HomeViewProtocol,
             coordinator: MySceneCoordinatorProtocol)
        {
            self.interactor = interactor
            self.customView = customView
            self.coordinator = coordinator
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError()
        }

        override func loadView() {
            view = customView
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            interactor.fetchMySceneData()
        }
    }
}

extension Home.ViewController: HomePresenterDelegate {}
