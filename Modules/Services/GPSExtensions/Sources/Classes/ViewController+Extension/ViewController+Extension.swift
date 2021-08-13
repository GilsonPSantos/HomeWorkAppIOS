import Foundation

public extension UIViewController {
    func hiddenNavitionBar(animated: Bool = false) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    func showNavitionBar(animated: Bool = false) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
