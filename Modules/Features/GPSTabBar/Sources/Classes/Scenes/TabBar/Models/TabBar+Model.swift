import Foundation

extension TabBar {
    struct Model {
        let itemTab: ItemTab
        let indexTab: Int
    }

    enum ItemTab: Int, CaseIterable {
        case home
        case favorite
    }
}
