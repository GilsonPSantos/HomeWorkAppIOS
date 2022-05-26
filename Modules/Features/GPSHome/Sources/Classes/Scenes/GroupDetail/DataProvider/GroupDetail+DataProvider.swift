import Foundation
import PromiseKit

protocol GroupDetailDataProviderProtocol {
    func fetchMySceneData() -> Promise<GroupDetail.Response>
}

extension GroupDetail {
    final class DataProvider: GroupDetailDataProviderProtocol {
        func fetchMySceneData() -> Promise<GroupDetail.Response>
        {
            return Promise.value(GroupDetail.Response())
        }
    }
}
