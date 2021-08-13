import Foundation

extension TabBar {
    struct ViewModel {
        struct ElementViewModel {
            let title: String
            let image: UIImage
            let selectedImage: UIImage
            let itemTab: ItemTab
            let indexTab: Int
        }
        let sceneTitle: String
        let elements: [ElementViewModel]

    }
}
