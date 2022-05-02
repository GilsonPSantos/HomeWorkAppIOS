import UIKit

open class ViewController: UIViewController {
    deinit {
        printDeinitInfo(of: self)
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
    }

    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    public func setTitle(title: String) {
        getNavigation()?.setTitle(title: title)
    }

    public func addNavigationButton(type: ButtonNavigationType, target: Selector, position: ButtonItemPosition) {
        let button = createButtonBar(type: getSystemItem(to: type), target: target)
        if position == .right {
            navigationItem.rightBarButtonItem = button
        } else {
            navigationItem.leftBarButtonItems = [button]
        }
    }

    private func getSystemItem(to type: ButtonNavigationType) -> UIBarButtonItem.SystemItem {
        switch type {
        case .add:
            return .add
        }
    }

    private func createButtonBar(type: UIBarButtonItem.SystemItem, target: Selector) -> UIBarButtonItem {
        let button = UIBarButtonItem(barButtonSystemItem: type, target: self, action: target)
        button.tintColor = DesignSystemApp.shared.designSystem.navigation.tintColor
        return button
    }

    private func getNavigation() -> NavigationController? {
        return navigationController as? NavigationController
    }
}

extension UIViewController {
    func printDeinitInfo(of object: Any) {
        #if APPSTORE
        #else
        print("-- GPS Deinit \(object) --")
        #endif
    }
}
