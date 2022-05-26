import GPSUI

extension GroupDetail {
    final class ViewController: GPSUI.ViewController {
        private let interactor: GroupDetailInteractorProtocol
        private let customView: GroupDetailViewProtocol
        private var viewModel: [GroupDetail.ViewModel] = []

        init(interactor: GroupDetailInteractorProtocol,
             customView: GroupDetailViewProtocol)
        {
            self.interactor = interactor
            self.customView = customView
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder aDecoder: NSCoder)
        {
            fatalError()
        }

        override func loadView()
        {
            view = customView
        }

        override func viewDidLoad()
        {
            super.viewDidLoad()
            setupButtonNavigation()
            setTitle(title: "Meus Grupos")
            interactor.fetchData()
        }

        private func setupButtonNavigation()
        {
            addNavigationButton(type: .add, target: #selector(addGroup), position: .right)
        }

        @objc private func addGroup()
        {
            interactor.createGroup()
        }
    }
}

extension GroupDetail.ViewController: GroupDetailViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return viewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeue(cell: GroupDetailCell.self) else {
            return UITableViewCell()
        }
        cell.setup(viewModel: viewModel[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print(indexPath)
    }
}

extension GroupDetail.ViewController: GroupDetailPresenterDelegate {
    func render(_ viewModel: [GroupDetail.ViewModel])
    {
        self.viewModel = viewModel
        customView.reloadData()
    }
}
