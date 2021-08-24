protocol MySceneCoordinatorProtocol {
    func showInitialScene()
}

extension Home {
    final class Coordinator {
        private let dependencies: Dependencies
        weak var rootViewController: UIViewController?

        init(dependencies: Dependencies) {
            self.dependencies = dependencies
        }
    }
}

extension Home.Coordinator: MySceneCoordinatorProtocol {
    func showInitialScene() {

    }
}
