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
            setTitle(title: "Nome do Grupo")
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

        let headerView = GroupDetailHeaderView.make()
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



    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
//        let headerView = GroupDetailHeaderView.make()
        headerView.setup(delegate: self)
        return headerView
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    {
        return UIView()
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        .leastNormalMagnitude
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print(indexPath)
    }
}

extension GroupDetail.ViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeue(cell: OptionCollectionCell.self, for: indexPath)
            else
        {
            return UICollectionViewCell()
        }
        return cell
    }
}

//extension GroupDetail.ViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize
//    {
//        return CGSize(width: 100, height: 50)
//    }
//
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumLineSpacingForSectionAt section: Int) -> CGFloat
//    {
//        return Style.margins.extraSmall
//    }
//}

extension GroupDetail.ViewController: GroupDetailPresenterDelegate {
    func render(_ viewModel: [GroupDetail.ViewModel])
    {
        self.viewModel = viewModel
        customView.reloadData()
        headerView.reloadData()
    }
}
