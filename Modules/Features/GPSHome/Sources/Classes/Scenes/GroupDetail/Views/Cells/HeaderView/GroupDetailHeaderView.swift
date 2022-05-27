import Cartography
import GPSUI

protocol GroupDetailHeaderViewProtocol where Self: UIView {
    func setup(delegate: GroupDetailHeaderViewDelegate)
    func reloadData()
}

typealias GroupDetailHeaderViewDelegate = UICollectionViewDataSource

final class GroupDetailHeaderView: UIView, GroupDetailHeaderViewProtocol {
    static func make() -> GroupDetailHeaderViewProtocol
    {
        return GroupDetailHeaderView(collectionView: collectionView())
    }

    private static func collectionView() -> UICollectionView
    {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.minimumLineSpacing = 20
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = DesignSystemApp.shared.designSystem.backgroundColor
        collection.register(OptionCollectionCell.self)
        return collection
    }

    private let collectionView: UICollectionView

    init(frame: CGRect = .zero,
         collectionView: UICollectionView)
    {
        self.collectionView = collectionView
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError()
    }

    private func setup()
    {
        backgroundColor = DesignSystemApp.shared.designSystem.backgroundColor
        setupCollectionView()
    }

    private func setupCollectionView()
    {
        addSubview(collectionView)
        constrain(collectionView, self) { view, superview in
            view.edges == superview.edges.inseted(by: Style.margins.regular)
            view.height == 50
        }
    }

    func setup(delegate: GroupDetailHeaderViewDelegate)
    {
//        self.collectionView.delegate = delegate
        self.collectionView.dataSource = delegate
    }

    func reloadData()
    {
        collectionView.reloadData()
    }
}
