import Cartography
import GPSUI

protocol GroupDetailViewProtocol where Self: UIView {
    func setup(delegate: GroupDetailViewDelegate)
    func reloadData()
}

typealias GroupDetailViewDelegate = UITableViewDataSource & UITableViewDelegate & UICollectionViewDataSource

final class GroupDetailView: UIView, GroupDetailViewProtocol {
    static func make() -> GroupDetailViewProtocol
    {
        return GroupDetailView(tableView: tableView())
    }

    private static func tableView() -> UITableView
    {
        let tableView = UITableView(frame: .zero)
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 48
        tableView.backgroundColor = DesignSystemApp.shared.designSystem.backgroundColor
//        tableView.register(OptionslCell.self)
        tableView.register(GroupDetailCell.self)
        return tableView
    }

    private let tableView: UITableView

    init(frame: CGRect = .zero,
         tableView: UITableView)
    {
        self.tableView = tableView
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
        setupTableView()
    }

    private func setupTableView()
    {
        addSubview(tableView)
        constrain(tableView, self) { view, superView in
            view.edges == superView.safeAreaLayoutGuide.edges
        }
    }

    func setup(delegate: GroupDetailViewDelegate)
    {
        self.tableView.delegate = delegate
        self.tableView.dataSource = delegate
    }

    func reloadData()
    {
        tableView.reloadData()
    }
}
