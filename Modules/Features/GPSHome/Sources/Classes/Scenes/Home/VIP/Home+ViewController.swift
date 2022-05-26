import GPSUI

extension Home {
    final class ViewController: GPSUI.ViewController {
        private let interactor: HomeInteractorProtocol
        private let customView: HomeViewProtocol
        private var viewModel: [Home.ViewModel] = []

        init(interactor: HomeInteractorProtocol,
             customView: HomeViewProtocol)
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

extension Home.ViewController: HomeViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return viewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeue(cell: HomeCell.self) else {
            return UITableViewCell()
        }
        cell.setup(viewModel: viewModel[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        interactor.didSelectCell(at: indexPath.row)
    }
}

extension Home.ViewController: HomePresenterDelegate {
    func render(_ viewModel: [Home.ViewModel])
    {
        self.viewModel = viewModel
        customView.reloadData()
    }
}
