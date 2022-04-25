import Foundation
import GPSUI

extension TabBar {
    final class ViewController: UITabBarController {
        private let interactor: Interactor

        init(interactor: Interactor) {
            self.interactor = interactor
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func viewDidLoad() {
            super.viewDidLoad()
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            interactor.viewWillAppear()
        }
    }
}

extension TabBar.ViewController: TabBarViewDelegate {
    func showTab(viewModel: TabBar.ViewModel) {
        let color = DesignSystemApp.shared.designSystem.navigation.backgroundColor
        viewModel.elements.enumerated().forEach {
            viewControllers?[$0.offset].tabBarItem.title = $0.element.title
            viewControllers?[$0.offset].tabBarItem.image = $0.element.image
            viewControllers?[$0.offset].tabBarItem.selectedImage = $0.element.selectedImage
        }
        tabBar.tintColor = color
    }
}
