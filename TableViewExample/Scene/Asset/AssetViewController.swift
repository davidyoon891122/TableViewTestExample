//
//  AssetViewController.swift
//  TableViewExample
//
//  Created by iMac on 2022/07/11.
//

import UIKit
import SnapKit

class AssetViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(
            AssetTableViewCell.self,
            forCellReuseIdentifier: AssetTableViewCell.identifier
        )
        tableView.backgroundColor = .secondarySystemBackground
        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

extension AssetViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 5
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: AssetTableViewCell.identifier,
            for: indexPath
        ) as? AssetTableViewCell else {
            return UITableViewCell()
        }
        cell.setupCell()
        return cell
    }
}

extension AssetViewController: UITableViewDelegate {
    
}

private extension AssetViewController {
    func setupViews() {
        [
            tableView
        ]
            .forEach {
                view.addSubview($0)
            }

        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
