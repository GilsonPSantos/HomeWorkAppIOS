import Foundation

protocol HomeInteractorProtocol {
    func fetchMySceneData()
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

        func fetchMySceneData() {}
    }
}
