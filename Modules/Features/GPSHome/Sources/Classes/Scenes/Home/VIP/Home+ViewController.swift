import GPSUI

extension Home {
    final class ViewController: GPSUI.ViewController {
        private let interactor: HomeInteractorProtocol
        private let customView: HomeViewProtocol
        private let coordinator: HomeCoordinatorProtocol

        init(interactor: HomeInteractorProtocol,
             customView: HomeViewProtocol,
             coordinator: HomeCoordinatorProtocol)
        {
            self.interactor = interactor
            self.customView = customView
            self.coordinator = coordinator
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError()
        }

        override func loadView() {
            view = customView
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            setupButtonNavigation()
            setTitle(title: "Meus Grupos")
            interactor.fetchData()
        }

        private func setupButtonNavigation() {
            addNavigationButton(type: .add, target: #selector(addGroup), position: .right)
        }

        @objc private func addGroup() {
            interactor.createGroup()
        }
    }
}

extension Home.ViewController: HomeViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: HomeCell.self) ?? UITableViewCell()
        return cell
    }
}

extension Home.ViewController: HomePresenterDelegate {}
