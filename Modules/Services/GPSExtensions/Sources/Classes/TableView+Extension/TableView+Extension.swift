import UIKit

public extension UITableView {
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(_ headerClass: T.Type) {
        self.register(headerClass, forHeaderFooterViewReuseIdentifier: String(describing: headerClass))
    }

    func register<T: UITableViewCell>(_ cellClass: T.Type) {
        self.register(cellClass, forCellReuseIdentifier: String(describing: cellClass))
    }

    func dequeue<T: UITableViewHeaderFooterView>(headerFooter: T.Type) -> T? {
        return dequeueReusableHeaderFooterView(withIdentifier: String(describing: headerFooter)) as? T
    }

    func dequeue<T: UITableViewCell>(cell cellClass: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: String(describing: cellClass)) as? T
    }
}
