import Cartography
import GPSUI

protocol HomeViewProtocol where Self: UIView {
    func setup(delegate: HomeViewDelegate)
    func render()
}

typealias HomeViewDelegate = UITableViewDataSource & UITableViewDelegate

final class HomeView: UIView, HomeViewProtocol {
    static func make() -> HomeViewProtocol {
        return HomeView(tableView: tableView())
    }

    private static func tableView() -> UITableView {
        let tableView = UITableView(frame: .zero)
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
        tableView.backgroundColor = DesignSystemApp.shared.designSystem.backgroundColor
        tableView.register(HomeCell.self)
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

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    private func setup() {
        backgroundColor = DesignSystemApp.shared.designSystem.backgroundColor
        setupTableView()
    }

    private func setupTableView() {
        addSubview(tableView)
        constrain(tableView, self) { view, superView in
            view.edges == superView.safeAreaLayoutGuide.edges
        }
    }

    func setup(delegate: HomeViewDelegate) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = delegate
    }

    func render() {
        tableView.reloadData()
    }
}
