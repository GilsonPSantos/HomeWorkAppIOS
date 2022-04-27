import Foundation

protocol HomeInteractorProtocol {
    func fetchData()
    func createGroup()
}

extension Home {
    final class Interactor: HomeInteractorProtocol {
        private var dataStore: HomeDataStoreProtocol
        private let presenter: HomePresenterProtocol
        private let dataProvider: HomeDataProviderProtocol

        init(dataStore: HomeDataStoreProtocol,
             presenter: HomePresenterProtocol,
             dataProvider: HomeDataProviderProtocol)
        {
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
    }
}
