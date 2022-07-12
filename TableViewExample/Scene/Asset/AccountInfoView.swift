//
//  AccountInfoView.swift
//  TableViewExample
//
//  Created by iMac on 2022/07/12.
//

import SnapKit
import UIKit

final class AccountInfoView: UIView {
    private lazy var accountInfoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12.0)
        label.text = "12345678-01 위탁계좌"
        label.textColor = .lightGray
        return label
    }()

    private lazy var accountNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0, weight: .bold)
        label.text = "임직원 매매계좌"
        return label
    }()

    private lazy var accountInfoCopyIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "doc.on.doc")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .lightGray
        return imageView
    }()

    init(
        accountNumber: String,
        accountName: String,
        copyIconName: String? = "doc.on.doc"
    ) {
        super.init(frame: .zero)
        accountInfoLabel.text = accountNumber
        accountNameLabel.text = accountName
        if let iconName = copyIconName {
            accountInfoCopyIconImageView.image = UIImage(systemName: iconName)
        }
        setupViews()

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


private extension AccountInfoView {
    func setupViews() {
        [
            accountInfoLabel,
            accountNameLabel,
            accountInfoCopyIconImageView
        ]
            .forEach {
                addSubview($0)
            }

        accountInfoLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }

        accountNameLabel.snp.makeConstraints {
            $0.top.equalTo(accountInfoLabel.snp.bottom).offset(2.0)
            $0.leading.equalTo(accountInfoLabel)
            $0.bottom.equalToSuperview()
        }

        accountInfoCopyIconImageView.snp.makeConstraints {
            $0.top.equalTo(accountInfoLabel)
            $0.leading.equalTo(accountInfoLabel.snp.trailing).offset(2.0)
            $0.width.height.equalTo(13.0)
            $0.trailing.equalToSuperview()
        }
    }
}
