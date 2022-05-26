import Foundation

protocol GroupDetailInteractorProtocol {
    func fetchData()
    func createGroup()
}

extension GroupDetail {
    final class Interactor: GroupDetailInteractorProtocol {
        private let coordinator: GroupDetailCoordinatorProtocol
        private var dataStore: GroupDetailDataStoreProtocol
        private let presenter: GroupDetailPresenterProtocol
        private let dataProvider: GroupDetailDataProviderProtocol

        init(coordinator: GroupDetailCoordinatorProtocol,
             dataStore: GroupDetailDataStoreProtocol,
             presenter: GroupDetailPresenterProtocol,
             dataProvider: GroupDetailDataProviderProtocol)
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
    }
}
