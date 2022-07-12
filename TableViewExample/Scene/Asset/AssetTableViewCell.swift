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

    private lazy var accountInfoView = AccountInfoView(
        accountNumber: "12345678-01 위탁계좌",
        accountName: "임직원 매매계좌",
        copyIconName: nil
    )

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

    private lazy var deposiTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "예수금"
        label.font = .systemFont(ofSize: 14.0)
        label.textColor = .lightGray
        return label
    }()

    private lazy var depositValueLabel: UILabel = {
        let label = UILabel()
        label.text = "2,266,533원"
        label.font = .systemFont(ofSize: 14.0)
        label.textColor = .gray
        return label
    }()

    private lazy var accountDetailView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 4.0
        let depositDetailView = AccountDetailRowView(
            title: "예수금",
            value: "2,266,533원"
        )
        let purchaingAmountView = AccountDetailRowView(
            title: "매입금액",
            value: "85,339,822원"
        )
        let valuationAmountView = AccountDetailRowView(
            title: "평가금액",
            value: "47,419,165원"
        )
        let withdrawalAmountView = AccountDetailRowView(
            title: "출금가능금액",
            value: "26,013원"
        )
        [
            depositDetailView,
            purchaingAmountView,
            valuationAmountView,
            withdrawalAmountView
        ]
            .forEach {
                view.addSubview($0)
            }

        let inset: CGFloat = 8.0
        depositDetailView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(inset)
            $0.leading.equalToSuperview().offset(inset)
            $0.trailing.equalToSuperview().offset(-inset)
        }

        purchaingAmountView.snp.makeConstraints {
            $0.top.equalTo(depositDetailView.snp.bottom).offset(4.0)
            $0.leading.equalTo(depositDetailView)
            $0.trailing.equalTo(depositDetailView)
  
        }

        valuationAmountView.snp.makeConstraints {
            $0.top.equalTo(purchaingAmountView.snp.bottom).offset(4.0)
            $0.leading.equalTo(depositDetailView)
            $0.trailing.equalTo(depositDetailView)
        }

        withdrawalAmountView.snp.makeConstraints {
            $0.top.equalTo(valuationAmountView.snp.bottom).offset(4.0)
            $0.leading.equalTo(depositDetailView)
            $0.trailing.equalTo(depositDetailView)
            $0.bottom.equalToSuperview().offset(-inset)
        }
        return view
    }()

    private let assetButtonView = AssetBottomButtonView()

    private lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white

        [
            accountInfoView,
            moreButton,
            accountTotalPrice,
            priceChangeView,
            accountDetailView,
            assetButtonView
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
        }

        accountDetailView.snp.makeConstraints {
            $0.top.equalTo(priceChangeView.snp.bottom).offset(20.0)
            $0.leading.equalToSuperview().offset(inset)
            $0.trailing.equalToSuperview().offset(-inset)
        }

        assetButtonView.snp.makeConstraints {
            $0.top.equalTo(accountDetailView.snp.bottom).offset(20.0)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-inset)
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
        selectionStyle = .none
        [
            cellView
        ]
            .forEach {
                contentView.addSubview($0)
            }

        let inset: CGFloat = 16.0
        let topInset: CGFloat = 4.0

        cellView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(topInset)
            $0.leading.equalToSuperview().offset(inset)
            $0.trailing.equalToSuperview().offset(-inset)
            $0.bottom.equalToSuperview().offset(-topInset)
        }
    }
}
