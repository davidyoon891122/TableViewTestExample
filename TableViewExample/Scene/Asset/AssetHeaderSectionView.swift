//
//  AssetHeaderSectionView.swift
//  TableViewExample
//
//  Created by iMac on 2022/07/12.
//

import Foundation
import SnapKit
import UIKit

final class AssetHeaderSectionView: UITableViewHeaderFooterView {
    static let identifier: String = "AssetHeaderSectionView"
    private lazy var testLabel: UILabel = {
        let label = UILabel()
        label.text = "TableViewHeader"
        label.textColor = .gray
        return label
    }()

    private lazy var accountAssetButton = AssetButtonViewWithUnderBar(title: "계좌별 자산")

    private lazy var accountAssetButtonUnderBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

    private lazy var productAssetButton = AssetButtonViewWithUnderBar(title: "상품유형별 자산")


    private lazy var assetSelectHStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        [
            accountAssetButton,
            productAssetButton
        ]
            .forEach {
                stackView.addArrangedSubview($0)
            }
        stackView.backgroundColor = .white
        return stackView
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
        accountAssetButton.isSelected = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setSelectedButton() {

    }
}

private extension AssetHeaderSectionView {
    func setupViews() {
        [
            assetSelectHStackView
        ]
            .forEach {
                addSubview($0)
            }

        assetSelectHStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(40.0)
        }
    }
}
