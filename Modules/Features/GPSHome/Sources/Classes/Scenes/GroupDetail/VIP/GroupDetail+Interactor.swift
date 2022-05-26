import Foundation

protocol GroupDetailInteractorProtocol {
    func fetchData()
    func createGroup()
}

extension GroupDetail {
    final class Interactor: GroupDetailInteractorProtocol {
        private var dataStore: GroupDetailDataStoreProtocol
        private let presenter: GroupDetailPresenterProtocol
        private let dataProvider: GroupDetailDataProviderProtocol

        init(dataStore: GroupDetailDataStoreProtocol,
             presenter: GroupDetailPresenterProtocol,
             dataProvider: GroupDetailDataProviderProtocol)
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
