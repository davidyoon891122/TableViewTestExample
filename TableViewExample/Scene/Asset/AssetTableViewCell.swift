//
//  AssetTableViewCell.swift
//  TableViewExample
//
//  Created by iMac on 2022/07/12.
//

import Foundation
import SnapKit
import UIKit

final class AssetTableViewCell: UITableViewCell {
    static let identifier = "AssetTableViewCell"
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

    private lazy var accountInfoView: UIView = {
        let view = UIView()
        [
            accountInfoLabel,
            accountNameLabel,
            accountInfoCopyIconImageView
        ]
            .forEach {
                view.addSubview($0)
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
        return view
    }()

    private lazy var moreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.tintColor = .black
        return button
    }()

    private lazy var accountTotalPrice: UILabel = {
        let label = UILabel()
        label.text = "51,320,168원"
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        label.textAlignment = .center
        label.textColor = .label
        return label
    }()

    private lazy var accountIncreaseValueLable: UILabel = {
        let label = UILabel()
        label.text = "-36,337,207원"
        label.textColor = .blue
        label.font = .systemFont(ofSize: 13.0)
        return label
    }()

    private lazy var separatorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "poweron")
        imageView.tintColor = .lightGray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var accountPercentageLabel: UILabel = {
        let label = UILabel()
        label.text = "-42.57%"
        label.textColor = .blue
        label.font = .systemFont(ofSize: 13.0)
        return label
    }()

    private lazy var priceChangeView: UIView = {
        let view = UIView()
        [
            accountIncreaseValueLable,
            separatorImageView,
            accountPercentageLabel
        ]
            .forEach {
                view.addSubview($0)
            }

        accountIncreaseValueLable.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }

        separatorImageView.snp.makeConstraints {
            $0.top.equalTo(accountIncreaseValueLable)
            $0.leading.equalTo(accountIncreaseValueLable.snp.trailing).offset(4.0)
            $0.width.equalTo(12.0)
            $0.height.equalTo(14.0)
        }

        accountPercentageLabel.snp.makeConstraints {
            $0.top.equalTo(separatorImageView)
            $0.leading.equalTo(separatorImageView.snp.trailing).offset(4.0)
            $0.trailing.equalToSuperview()
        }

        return view
    }()

    private lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white

        [
            accountInfoView,
            moreButton,
            accountTotalPrice,
            priceChangeView
        ]
            .forEach {
                view.addSubview($0)
            }

        let inset: CGFloat = 16.0
        accountInfoView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(inset)
            $0.leading.equalToSuperview().offset(inset)
        }

        moreButton.snp.makeConstraints {
            $0.top.equalTo(accountInfoView)
            $0.trailing.equalToSuperview().offset(-inset)
            $0.width.height.equalTo(14.0)
        }

        accountTotalPrice.snp.makeConstraints {
            $0.top.equalTo(accountInfoView.snp.bottom).offset(20.0)
            $0.leading.equalTo(accountInfoView)
            $0.trailing.equalTo(moreButton)
        }

        priceChangeView.snp.makeConstraints {
            $0.top.equalTo(accountTotalPrice.snp.bottom).offset(8.0)
            $0.centerX.equalTo(accountTotalPrice)
            $0.bottom.equalToSuperview()
        }

        return view
    }()

    func setupCell() {
        setupViews()
    }
}

private extension AssetTableViewCell {
    func setupViews() {
        backgroundColor = .secondarySystemBackground
        cellView.layer.cornerRadius = 8.0
        cellView.layer.borderWidth = 0.5
        cellView.layer.borderColor = UIColor.lightGray.cgColor
        [
            cellView
        ]
            .forEach {
                contentView.addSubview($0)
            }

        let inset: CGFloat = 16.0

        cellView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(inset)
            $0.leading.equalToSuperview().offset(inset)
            $0.trailing.equalToSuperview().offset(-inset)
            $0.bottom.equalToSuperview().offset(-inset)
        }



    }
}
