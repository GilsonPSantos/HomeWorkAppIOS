import Foundation

protocol HomeInteractorProtocol {
    func fetchData()
    func createGroup()
    func didSelectCell(at index: Int)
}

extension Home {
    final class Interactor: HomeInteractorProtocol {
        private let coordinator: HomeCoordinatorProtocol
        private var dataStore: HomeDataStoreProtocol
        private let presenter: HomePresenterProtocol
        private let dataProvider: HomeDataProviderProtocol

        init(coordinator: HomeCoordinatorProtocol,
             dataStore: HomeDataStoreProtocol,
             presenter: HomePresenterProtocol,
             dataProvider: HomeDataProviderProtocol)
        {
            self.coordinator = coordinator
            self.dataStore = dataStore
            self.presenter = presenter
            self.dataProvider = dataProvider
        }

        func fetchData()
        {
            presenter.present()
        }

        func createGroup()
        {
            print("createGroup called")
        }

        func didSelectCell(at index: Int)
        {
            coordinator.showDetail()
        }
    }
}
