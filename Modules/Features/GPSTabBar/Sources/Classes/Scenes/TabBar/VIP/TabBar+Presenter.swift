import Foundation

protocol TabBarPresenterProtocol {
    func present(model: [TabBar.Model])
}

protocol TabBarViewDelegate: NSObject {
    func showTab(viewModel: TabBar.ViewModel)
}

extension TabBar {
    final class Presenter: TabBarPresenterProtocol {
        weak var viewController: TabBarViewDelegate?

        func present(model: [TabBar.Model]) {
            viewController?.showTab(viewModel: createViewModel(model: model))
        }

        private func createViewModel(model: [TabBar.Model]) -> ViewModel {
            .init(sceneTitle: "", elements: createItensViewModel(model: model))
        }

        private func createItensViewModel(model: [TabBar.Model]) -> [ViewModel.ElementViewModel] {
            model.map {
                let element = getElement(model: $0)
                return ViewModel.ElementViewModel(title: element.title, image: element.image, selectedImage: element.selectedImage, itemTab: $0.itemTab, indexTab: $0.indexTab)
            }
        }

        private func getElement(model: TabBar.Model) -> (title: String, image: UIImage, selectedImage: UIImage) {
            var title = ""
            var imageName = UIImage()
            var selectedImage = UIImage()

            switch model.itemTab {
            case .home:
                title = S.TabBar.Item.Home.title
                imageName = getImage(with: S.TabBar.Item.Home.imageName)
                selectedImage = getImage(with: S.TabBar.Item.Home.selectedImageName)
            case .favorite:
                title = S.TabBar.Item.Favorite.title
                imageName = getImage(with: S.TabBar.Item.Favorite.imageName)
                selectedImage = getImage(with: S.TabBar.Item.Favorite.selectedImageName)
            }

            return (title: title,
                    image: imageName,
                    selectedImage: selectedImage)
        }

        private func getImage(with name: String) -> UIImage {
            let defaultImage = UIImage()
            if #available(iOS 13.0, *) {
                return UIImage(systemName: name) ?? defaultImage
            } else {
                return defaultImage
            }
        }
    }
}
