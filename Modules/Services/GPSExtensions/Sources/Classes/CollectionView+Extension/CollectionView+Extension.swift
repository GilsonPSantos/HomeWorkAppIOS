import UIKit

public extension UICollectionView {
    func register<T: UICollectionViewCell>(_ cellClass: T.Type)
    {
        self.register(cellClass, forCellWithReuseIdentifier: String(describing: cellClass))
    }

    func dequeue<T: UICollectionViewCell>(cell cellClass: T.Type, for indexPath: IndexPath) -> T?
    {
        return dequeueReusableCell(withReuseIdentifier: String(describing: cellClass), for: indexPath) as? T
    }
}
