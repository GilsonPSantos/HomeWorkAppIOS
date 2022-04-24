import Foundation

public enum ButtonNavigationType {
    case add
}

public enum ButtonItemPosition {
    case right
    case left
}

public class NavigationController: UINavigationController {

    override open func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationColor()
        setupAppearance()
    }

    private func setupNavigationColor() {
        self.navigationBar.titleTextAttributes = [.foregroundColor: DesignSystemApp.shared.designSystem.navigation.tintColor]
    }

    private func setupAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.shadowImage = UIImage()
        appearance.backgroundColor = DesignSystemApp.shared.designSystem.navigation.backgroundColor
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
    }

     func setTitle(title: String) {
        self.navigationBar.topItem?.title = title
    }
}
