//
//  AccountDetailRowView.swift
//  TableViewExample
//
//  Created by iMac on 2022/07/12.
//

import SnapKit
import UIKit

final class AccountDetailRowView: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "예수금"
        label.font = .systemFont(ofSize: 12.0)
        label.textColor = .lightGray
        label.textAlignment = .left
        return label
    }()

    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.text = "2,266,533원"
        label.font = .systemFont(ofSize: 12.0)
        label.textColor = .gray
        label.textAlignment = .right
        return label
    }()

    private lazy var detailHStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        [
            titleLabel,
            valueLabel
        ]
            .forEach {
                stackView.addArrangedSubview($0)
            }
        return stackView
    }()

    init(
        title: String,
        value: String
    ) {
        super.init(frame: .zero)
        setupViews()
        titleLabel.text = title
        valueLabel.text = value
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension AccountDetailRowView {
    func setupViews() {
        [
            detailHStackView
        ]
            .forEach {
                addSubview($0)
            }

        detailHStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

    }
}
