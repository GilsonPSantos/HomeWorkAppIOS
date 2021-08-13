import Foundation

protocol TabBarInteractorProtocol {
    func viewWillAppear()
}

extension TabBar {
    final class Interactor: TabBarInteractorProtocol {
        private let dataStore: TabBarDataStoreProtocol
        private let presenter: TabBarPresenterProtocol
        private let coordinator: TabBarCoordinatorProtocol

        init(dataStore: TabBarDataStoreProtocol,
             presenter: TabBarPresenterProtocol,
             coordinator: TabBarCoordinatorProtocol)
        {
            self.dataStore = dataStore
            self.presenter = presenter
            self.coordinator = coordinator
        }

        func viewWillAppear() {
            presenter.present(model: createModel())
        }

        private func createModel() -> [Model] {
            var models = [Model]()
            dataStore.itensTabBar.enumerated().forEach {
                guard let item = ItemTab(rawValue: $0.offset) else {
                    return
                }
                models.append(Model(itemTab: item, indexTab: $0.offset))
            }
            return models
        }
    }
}
