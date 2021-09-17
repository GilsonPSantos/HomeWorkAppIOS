import Foundation
import PromiseKit

protocol HomeDataProviderProtocol {
    func fetchMySceneData() -> Promise<Home.Response>
}

extension Home {
    final class DataProvider: HomeDataProviderProtocol {
        func fetchMySceneData() -> Promise<Home.Response> {
            return Promise.value(Home.Response())
        }
    }
}
