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

    private lazy var accountAssetButton: UIButton = {
        let button = UIButton()
        button.setTitle("계좌별 자산", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.setTitleColor(.black, for: .selected)
        button.titleLabel?.font = .systemFont(ofSize: 16.0)
        return button
    }()

    private lazy var productAssetButton: UIButton = {
        let button = UIButton()
        button.setTitle("상품유형별 자산", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.setTitleColor(.black, for: .selected)
        button.titleLabel?.font = .systemFont(ofSize: 16.0)
        return button
    }()


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
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
