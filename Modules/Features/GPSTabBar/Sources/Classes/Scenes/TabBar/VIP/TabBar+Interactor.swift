import Foundation

protocol TabBarInteractorProtocol {

}

extension TabBar {
    final class Interactor: TabBarInteractorProtocol {
        private let presenter: TabBarPresenterProtocol
        private let coordinator: TabBarCoordinatorProtocol

        init(presenter: TabBarPresenterProtocol,
             coordinator: TabBarCoordinatorProtocol)
        {
            self.presenter = presenter
            self.coordinator = coordinator
        }
    }
}
